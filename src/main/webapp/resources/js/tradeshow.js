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
            
            $('#search').marcoPolo({
            	  url: getContextPath()+ "/search",
            	  minChars: 3,
            	  required: true,
            	  formatItem: function (data, $item) {
            	    return data.first_name + ' ' + data.last_name;
            	  },
            	  onSelect: function (data, $item) {
//            	    window.location = data.profile_url;
            		  alert(data.profile_url);
            	  },
            	  formatData:function (data){
            		  return data.first_name + ' ' + data.last_name;
            	  }
            	});
            
            
       }); 
 
 function getContextPath() {
	   return ctx;
	}
 
 