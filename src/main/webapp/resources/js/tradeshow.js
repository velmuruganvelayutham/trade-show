 $(document).ready(function() { 
	 var options = { 
			    beforeSend: function() 
			    {
			   	 $("#progress").show();
			   	 $("#message").html("");
			      
			    },
			    uploadProgress: function(event, position, total, percentComplete) 
			    {
			 
			    },
			    success: function() 
			    {
			    	 $("#progress").hide();
			    },
			    complete: function(response) 
			    {
			    	var str="uploaded successfully";
			        $("#message").html("<font color='green'>"+ str  +"</font>");
			    },
			    error: function()
			    {
			        $("#message").html("<font color='red'> ERROR: unable to upload files</font>");
			    }
			}; 
	 
            // bind 'myForm' and provide a simple callback function 
            $('#importCSV').ajaxForm(options); 
            
            $(function () {
     		   $('table').footable({ bookmarkable: { enabled: true }}).bind({
                 'footable_filtering': function (e) {
                     var selected = $('.filter-status').find(':selected').text();
                     if (selected && selected.length > 0) {
                         e.filter += (e.filter && e.filter.length > 0) ? ' ' + selected : selected;
                         e.clear = !e.filter;
                     }
                 },
                 'footable_filtered': function() {
                     var count = $('table.demo tbody tr:not(.footable-filtered)').length;
                     $('.row-count').html(count + ' rows found');
                 }
             });

             $('.clear-filter').click(function (e) {
                 e.preventDefault();
                 $('.filter-status').val('');
                 $('table.demo').trigger('footable_clear_filter');
                 $('.row-count').html('');
             });

             $('.filter-status').change(function (e) {
                 e.preventDefault();
                 $('table.demo').data('footable-filter').filter( $('#filter').val() );
             });
         });
            
//            $('#search').marcoPolo({
//            	  url: getContextPath()+ "/search",
//            	  minChars: 3,
//            	  required: true,
//            	  formatItem: function (data, $item) {
//            	    return data.first_name + ' ' + data.last_name;
//            	  },
//            	  onSelect: function (data, $item) {
//            	    window.location = data.profile_url;
//            		  alert(data.profile_url);
//            	  },
//            	  formatData:function (data){
//            		  return data.first_name + ' ' + data.last_name;
//            	  }
//            	});
            
            

            
//            $('#search').autocomplete({
//                serviceUrl: getContextPath()+ "/search",
//                paramName:'q',
//                dataType:'json',
//                minChars:3,
//                onSelect: function (suggestion) {
//                    alert('You selected: ' + suggestion.value + ', ' + suggestion.data);
//                },
//                onSearchComplete: function (query, suggestions) {
//                	
//                	console.log(suggestions);
//                	
//                }
//            });
          
            
            $('#newURLSave').click(function(){
             	var text= $('#newURLText').val();
             	$.ajax({
             		  type: "POST",
             		  url:  getContextPath()+ "/settings/save",
             		  data: { "url": text}
             		})
             		  .done(function( msg ) {
             			location.reload();
             		    alert(msg );
             		  }).fail(function( msg ) {
             		    alert(msg );
             		  });

             	console.log('newurl save is clicked !'+ text);
             	
             });
            
            
            var bestPictures = new Bloodhound({
                datumTokenizer: Bloodhound.tokenizers.obj.whitespace('first_name'),
                queryTokenizer: Bloodhound.tokenizers.whitespace,
                remote: getContextPath()+'/search?q=%QUERY'
            });

            bestPictures.initialize();
            var compiledTemplate = Hogan.compile('<p  class="repo-language" ><strong>{{first_name}}</strong></p>');
            $('#bloodhound .typeahead').typeahead(null, {
                name: 'best-pictures',
                displayKey: 'first_name',
                source: bestPictures.ttAdapter(),
                templates: {
                    empty: [
                      '<div class="empty-message">',
                      'unable to find any results !',
                      '</div>'
                    ].join('\n'),
                    suggestion: compiledTemplate.render.bind(compiledTemplate)
                  }
               
            });
            
            // enable and disable buttons:
            $(':checkbox').click(function(){
            	var n = $( "input:checked" ).length;
            	console.log('length is '+ n);
            	if(n!==0){
	               	 $("#deleteBtn").removeClass('disabled');
	               	 $("#editBtn").removeClass('disabled');
            	 }
            	else{
                   	 $("#deleteBtn").addClass('disabled');
                   	 $("#editBtn").addClass('disabled');
            	}
             });
            
            // click of Add button , show a modal with id "addNewVendor"
            $('#addBtn').click(function(){
            	$('#addNewVendor').modal('show');
            	
            });
            
            // click of refresh button , show a modal with id "addNewVendor"
            $('#refreshBtn').click(function(){
            	location.reload();
            });
            
            // click of Delete button , show conform dialog and if yes, delete it.
            $('#deleteBtn').click(function(){
            	console.log('delete button is clicked');
            	var selected=$( "input:checked" );
            	var parent=selected.parent().parent();
            	console.log('selected rows: '+ selected);
            	var ids=[];
            	for(i=0;i<selected.length;i++){
            		var id= {"id": selected[i].value};
            		ids.push(id);
            	}
            	console.log('ids: '+ ids);
            	 $.ajax(
                         {
                             url : "exhibitors/delete",
                             type: "POST",
                             contentType:"application/json",
                             data :  JSON.stringify(ids),
                             beforeSend: function(){
                            	 $('#statusbar').empty();
                            	 $("#myModalLabel").html("<font color='black'>"+ "Deleting Vendor !. "  +"</font>");
                            	 $("#myModal").modal('show');
                             },
                             success:function(data, textStatus, jqXHR) 
                             {
                            	 parent.remove();
                            	 $("#myModal").modal('hide');
                			     $('#deleteBtn').addClass('disabled');
                			     $('#statusbar').append(' <div align="middle" > <strong>vendor deleted successfully!. </strong> </div>').show();
                             	 console.log(textStatus);
                             },
                             error: function(jqXHR, textStatus, errorThrown) 
                             {
                             	alert(errorThrown);     
                             }
                         });
            });
            
            
          //callback handler for form submit
//            $("#ajaxform").submit(function(e)
//            {
//                var postData = $(this).serializeArray();
//                var formURL = $(this).attr("action");
//                $.ajax(
//                {
//                    url : formURL,
//                    type: "POST",
//                    data : postData,
//                    beforeSend:function(){
//                    	
//                    },
//                    success:function(data, textStatus, jqXHR) 
//                    {
//                        //data: return data from server
//                    	 console.log(textStatus);
//                    	 $('#addNewVendor').modal('hide');
//                    },
//                    error: function(jqXHR, textStatus, errorThrown) 
//                    {
//                    	alert(errorThrown);     
//                    }
//                });
//                e.preventDefault(); //STOP default action
//              //  e.unbind(); //unbind. to stop multiple form submit.
//            });
//            
//            // click of save button on the modal.
//            
//            $('#saveFormBtn').click(function(e){
//            	alert(e);
//            	$('#ajaxform').submit();            	
//            });
            
            
//            Bootstrap validator for add vendor modal form.
            $('form').bootstrapValidator({
                message: 'This value is not valid',
                onSuccess: function(e) {
                  // alert('success');
                },
                feedbackIcons: {
                    valid: 'glyphicon glyphicon-ok',
                    invalid: 'glyphicon glyphicon-remove',
                    validating: 'glyphicon glyphicon-refresh',
                    required: 'glyphicon glyphicon-asterisk',
                },
                fields: {
                    showName: {
                        message: 'The show name is not valid',
                        validators: {
                            notEmpty: {
                                message: 'The showname is required and cannot be empty'
                            },
                            stringLength: {
                                min: 6,
                                max: 30,
                                message: 'The showname must be more than 6 and less than 30 characters long'
                            }
                            
                        }
                    },
                    vendorName: {
                        validators: {
                            notEmpty: {
                                message: 'The vendorname is required and cannot be empty'
                            },
                            stringLength: {
                                min: 6,
                                max: 30,
                                message: 'The vendorname must be more than 6 and less than 30 characters long'
                            }                            
                        }
                    },
                    boothNo: {
                        validators: {
                            notEmpty: {
                                message: 'The boothno is required and cannot be empty'
                            },
                            stringLength: {
                                min: 1,
                                max: 30,
                                message: 'The boothno must be more than 1 and less than 30 characters long'
                            }                            
                        }
                    }
                }
            }).on('success.form.bv', function(e) {
                // Prevent form submission
                e.preventDefault();
              
                // Get the form instance
                var $form = $(e.target);

                // Get the BootstrapValidator instance
                var bv = $form.data('bootstrapValidator');

                // Use Ajax to submit form data
//                $.post($form.attr('action'), $form.serialize(), function(data,textStatus,jqXHR) {
//                  alert(textStatus);
//                }, 'json');
                
                $.ajax({
                          url : $form.attr('action'),
                          type: "POST",
                          data :  $form.serialize(),
                          beforeSend:function(){
                        	  $('#statusbar').empty();
                        	  $("#addNewVendorLabel").html("<font color='black'>"+ "Adding Vendor . Please wait!. "  +"</font>");
                          },
                          success:function(data, textStatus, jqXHR) 
                          {
                              //data: return data from server
                          	 console.log(textStatus);
                          	 $('#addNewVendor').modal('hide');
                          	 $('#statusbar').append(' <div align="middle" > <strong>vendor added successfully!. </strong> </div>').show();
                          	 
                          },
                          error: function(jqXHR, textStatus, errorThrown) 
                          {
                          	alert(errorThrown);     
                          }
                      });
                
                
                
            });
       }); 


 function submit(url,id){
 	var text= $('#'+id).val();
 	$.ajax({
 		  type: "POST",
 		  url:  getContextPath()+ url,
 		  beforeSend: function( xhr ) {
 			 $('#myModal').modal('show');
 			  },
 		  data: { "url": text,"id":id}
 		})
 		  .done(function( msg ) {
 			  location.reload();
 			  $('#myModal').modal('hide');
// 			  $('#settingsContainer').prepend('<div class="alert alert-success alert-dismissible" role="alert" align="center"> <button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button><strong>'+ msg + '</strong></div>');
 		    console.log(msg );
 		  }).fail(function( msg ) {
 		    alert(msg );
 		  });
 }
        
 function getContextPath() {
	   return ctx;
	}
 
 