$(function(){
    $(document).on("page:change",
        function(e){
            $('input[type="text"]:first').focus();
        }
    )}
)