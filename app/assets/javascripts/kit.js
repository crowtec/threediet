function initMultipleFields(selector_array) {
    $(selector_array).each(function(index, value){
        $(value).chosen({allow_single_deselect:true});
    });
}