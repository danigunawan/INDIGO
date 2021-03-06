// // # Place all the behaviors and hooks related to the matching controller here.
// // # All this logic will automatically be available in application.js.
// // # You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on("turbolinks:load", function() {

  var superindex_disease = $('#superindex-disease').text();

  console.log(superindex_disease);

  var stacy_table = $('#stacy-samples-table').DataTable({
    "autoWidth":false,
    "pageLength":100,
    "bServerSide":true,
    "bProcessing":true,
    "bPaginate":true,
    "ajax":'/dataview/sample_status.json',
    "pagingType":"full_numbers",
    "columns": [
      {"render": function(data, type, row, meta) {
        return data;
      }},
      {"render": function(data, type, row, meta) {
        return data;
      }},
      {"render": function(data, type, row, meta) {
        return data;
      }},
      {"render": function(data, type, row, meta) {
        return data;
      }},
      {"render": function(data, type, row, meta) {
        return data;
      }},
      {"render": function(data, type, row, meta) {
        return data;
      }},
      {"render": function(data, type, row, meta) {
        return data;
      }},
      {"render": function(data, type, row, meta) {
        return data;
      }},
      {"render": function(data, type, row, meta) {
        return data;
      }},
      {"render": function(data, type, row, meta) {
        return data;
      }},
      {"render": function(data, type, row, meta) {
        return data;
      }},
      {"render": function(data, type, row, meta) {
        console.log(row)
          if (data) {
            return '<a href='+row[12]+'>'+data+'</a>';
          }
          else {
            return '-';
          }
      }}
    ],
    "paging":true,
    "lengthMenu":[10,25,50,100,250,1000]
  });

  var samples_index_table = $('#samples-index-table').DataTable({
    "autoWidth":false,
    "pageLength":100,
    "bServerSide":true,
    "bProcessing":true,
    "bPaginate":true,
    "ajax":'/dataview/samples_index.json',
    "pagingType":"full_numbers",
    "columns": [
      {"render": function(data, type, row, meta) {
        return data;
      }},
      {"render": function(data, type, row, meta) {
        return data;
      }},
      {"render": function(data, type, row, meta) {
        return data;
      }},
      {"render": function(data, type, row, meta) {
        return data;
      }},
      {"render": function(data, type, row, meta) {
        return data;
      }},
      {"render": function(data, type, row, meta) {
        return data;
      }},
      {"render": function(data, type, row, meta) {
        return data;
      }},
      {"render": function(data, type, row, meta) {
        return data;
      }},
      {"render": function(data, type, row, meta) {
        return data;
      }},
      {"render": function(data, type, row, meta) {
        console.log(row)
          if (data) {
            return '<a href='+row[11]+'>'+data+'</a>';
          }
          else {
            return '-';
          }
      }}
    ],
    "paging":true,
    "lengthMenu":[10,25,50,100,250,500,1000,2500,5000,10000],
      "dom": "<'row'<'col-sm-2'l><'col-sm-2 col-sm-offset-8'f>>"+"<'row'<'col-sm-4 col-sm-offset-5'B>>" + "<'row'<'col-sm-12'rtip>>",
      "buttons": [
          {
              "extend":'csv',
              "text": '<i>Download CSV</i>',
              "className": 'btn btn-indigo btn-sm',
              "exportOptions": {
                  "columns": [0, ':visible']
              }
          }
      ]
  });
//var d = "Blfrtip" <- jquery datatables dom element list
  var hlas_index_table = $('#hlas-index-table').DataTable({
    "autoWidth":false,
    "pageLength":100,
    "bServerSide":true,
    "bProcessing":true,
    "bPaginate":true,
    "ajax":'/dataview/hla_index.json',
    "pagingType":"full_numbers",
    "paging":true,
      "lengthMenu":[10,25,50,100,250,500,1000,2500,5000,10000],
      "dom": "<'row'<'col-sm-2'l><'col-sm-2 col-sm-offset-8'f>>" + "<'row'<'col-sm-4 col-sm-offset-5'B>>" + "<'row'<'col-sm-12'rtip>>",
      "buttons": [
          {
              "extend":'csv',
              "text": '<i>Download CSV</i>',
              "className": 'btn btn-indigo btn-sm',
              "exportOptions": {
                  "columns": [0, ':visible']
              }
          }
      ]
  });

  var kirs_index_table = $('#kirs-index-table').DataTable({
    "autoWidth":false,
    "pageLength":100,
    "bServerSide":true,
    "bProcessing":true,
    "bPaginate":true,
    "ajax":'/dataview/kir_index.json',
    "pagingType":"full_numbers",
    "paging":true,
      "lengthMenu":[10,25,50,100,250,500,1000,2500,5000,10000],
      "dom": "<'row'<'col-sm-2'l><'col-sm-2 col-sm-offset-8'f>>" + "<'row'<'col-sm-4 col-sm-offset-5'B>>" + "<'row'<'col-sm-12'rtip>>",
      "buttons": [
          {
              "extend":'csv',
              "text": '<i>Download CSV</i>',
              "className": 'btn btn-indigo btn-sm',
              "exportOptions": {
                  "columns": [0, ':visible']
              }
          }
      ]
  });

  var samples_superindex_table = $('#samples-superindex-table').DataTable({
    "autoWidth":false,
    "pageLength":100,
    "bServerSide":true,
    "bProcessing":true,
    "bPaginate":true,
    "ajax":{"url":'/dataview/samples_superindex.json', "data": function(d) { d.disease = superindex_disease } },
    "pagingType":"full_numbers",
    "paging":true,
      "lengthMenu":[10,25,50,100,250,500,1000,2500,5000,10000],
      "dom": "<'row'<'col-sm-2'l><'col-sm-2 col-sm-offset-8'f>>" + "<'row'<'col-sm-4 col-sm-offset-5'B>>" + "<'row'<'col-sm-12'rtip>>",
      "buttons": [
          {
              "extend":'csv',
              "text": '<i>Download CSV</i>',
              "className": 'btn btn-indigo btn-sm',
              "exportOptions": {
                  "columns": [0, ':visible']
              }
          }
      ]
  });

  var hlas_superindex_table = $('#hlas-superindex-table').DataTable({
    "autoWidth":false,
    "pageLength":100,
    "bServerSide":true,
    "bProcessing":true,
    "bPaginate":true,
    "ajax":{"url":'/dataview/hla_superindex.json', "data": function(d) { d.disease = superindex_disease } },
    "pagingType":"full_numbers",
    "paging":true,
      "lengthMenu":[10,25,50,100,250,500,1000,2500,5000,10000],
      "dom": "<'row'<'col-sm-2'l><'col-sm-2 col-sm-offset-8'f>>" + "<'row'<'col-sm-4 col-sm-offset-5'B>>" + "<'row'<'col-sm-12'rtip>>",
      "buttons": [
          {
              "extend":'csv',
              "text": '<i>Download CSV</i>',
              "className": 'btn btn-indigo btn-sm',
              "exportOptions": {
                  "columns": [0, ':visible']
              }
          }
      ]
  });

  var kirs_superindex_table = $('#kirs-superindex-table').DataTable({
    "autoWidth":false,
    "pageLength":100,
    "bServerSide":true,
    "bProcessing":true,
    "bPaginate":true,
    "ajax":{"url":'/dataview/kir_superindex.json', "data": function(d) { d.disease = superindex_disease } },
    "pagingType":"full_numbers",
    "paging":true,
      "lengthMenu":[10,25,50,100,250,500,1000,2500,5000,10000],
      "dom": "<'row'<'col-sm-2'l><'col-sm-2 col-sm-offset-8'f>>" + "<'row'<'col-sm-4 col-sm-offset-5'B>>" + "<'row'<'col-sm-12'rtip>>",
      "buttons": [
          {
              "extend":'csv',
              "text": '<i>Download CSV</i>',
              "className": 'btn btn-indigo btn-sm',
              "exportOptions": {
                  "columns": [0, ':visible']
              }
          }
      ]
  });

  var kir_work_in_progress_table = $('#kir-work-in-progress-table').DataTable({
      "autoWidth":false,
      "pageLength":100,
      "bServerSide":true,
      "bProcessing":true,
      "bPaginate":true,
      "ajax":'/dataview/kir_wip_data.json',
      "pagingType":"full_numbers",
      "columns": [
          {"render": function(data, type, row, meta) {
                  return data;
              }},
          {"render": function(data, type, row, meta) {
                  return data;
              }},
          {"render": function(data, type, row, meta) {
                  return data;
              }},
          {"render": function(data, type, row, meta) {
                  return data;
              }},
          {"render": function(data, type, row, meta) {
                  return data;
              }},
          {"render": function(data, type, row, meta) {
                  return data;
              }},
          {"render": function(data, type, row, meta) {
                  return data;
              }},
          {"render": function(data, type, row, meta) {
                  return data;
              }},
          {"render": function(data, type, row, meta) {
                  return data;
              }},
          {"render": function(data, type, row, meta) {
                  return data;
              }},
          {"render": function(data, type, row, meta) {
                  return data;
              }}
      ],
      "paging":true,
      "lengthMenu":[10,25,50,100,250,1000]
  });

  var method_version = $('#version-date').text();

    var kir_method_version_table = $('#kir-method-version-table').DataTable({
        "autoWidth":false,
        "pageLength":100,
        "bServerSide":true,
        "bProcessing":true,
        "bPaginate":true,
        "ajax":{"url":'/dataview/method_version_data.json', "data": function(d) { d.method_version = method_version } },
        "pagingType":"full_numbers",
        "columns": [
            {"render": function(data, type, row, meta) {
                    return data;
                }},
            {"render": function(data, type, row, meta) {
                    return data;
                }},
            {"render": function(data, type, row, meta) {
                    return data;
                }},
            {"render": function(data, type, row, meta) {
                    return data;
                }},
            {"render": function(data, type, row, meta) {
                    return data;
                }},
            {"render": function(data, type, row, meta) {
                    return data;
                }},
            {"render": function(data, type, row, meta) {
                    return data;
                }},
            {"render": function(data, type, row, meta) {
                    return data;
                }},
            {"render": function(data, type, row, meta) {
                    return data;
                }},
            {"render": function(data, type, row, meta) {
                    return data;
                }}
        ],
        "paging":true,
        "lengthMenu":[10,25,50,100,250,1000]
    });

    var allele_frequencies_table = $('#allele-frequencies-table').DataTable({
        "autoWidth":false,
        "pageLength":100,
        "bServerSide":true,
        "bProcessing":true,
        "bPaginate":true,
        "ajax":'/dataview/allele_frequencies_data.json',
        "pagingType":"full_numbers",
        "paging":false,
        "lengthMenu":[10,25,50,100,250,1000],
        "scrollX":true,
        "scrollCollapse":true,
        "fixedColumns":{
            "leftColumns":3,
            "rightColumns":0
        }
    });

  var tables = {
    "samples-index-table":samples_index_table,
    "hlas-index-table":hlas_index_table,
    "kirs-index-table":kirs_index_table,
    "samples-superindex-table":samples_superindex_table,
    "hlas-superindex-table":hlas_superindex_table,
    "kirs-superindex-table":kirs_superindex_table
  }


  $('.show-column-checkbox').on('change', function(){
    var table = tables[$(this).data("table-id")];
    var col = $(this).data("column");
    var checked = $(this).prop("checked");
    table.columns(col).visible(checked);
  })
});
