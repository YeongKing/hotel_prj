let jquery_datatable = $("#table1").DataTable({
    responsive: true,
    dom:
		"<'ro w'<'col-11'f><'col-1'l>>" +
		"<'row dt-row'<'col-sm-12'tr>>" +
		"<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'p>>",
    language: {
        emptyTable: "데이터가 없습니다.",
        lengthMenu: "보기_MENU_",
        search: "검색",
        searchPlaceholder: "검색어를 입력하세요.",
        paginate: {
            "next": "다음",
            "previous": "이전"
        },
        info: "현재 _START_ - _END_ / 총 _TOTAL_건",
        infoEmpty: "데이터 없음",
        infoFiltered: "( _MAX_건의 데이터에서 필터링됨 )",
        loadingRecords: "로딩중...",
        processing:     "잠시만 기다려 주세요..."
    }
})
let customized_datatable = $("#table2").DataTable({
    responsive: true,
    pagingType: 'simple',
    dom:
		"<'row'<'col-3'l><'col-9'f>>" +
		"<'row dt-row'<'col-sm-12'tr>>" +
		"<'row'<'col-4'i><'col-8'p>>",
    "language": {
        "info": "Page _PAGE_ of _PAGES_",
        "lengthMenu": "_MENU_ ",
        "search": "",
        "searchPlaceholder": "Search.."
    }
})

const setTableColor = () => {
    document.querySelectorAll('.dataTables_paginate .pagination').forEach(dt => {
        dt.classList.add('pagination-primary')
    })
}
setTableColor()
jquery_datatable.on('draw', setTableColor)