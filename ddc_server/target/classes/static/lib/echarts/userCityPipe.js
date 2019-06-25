function drewUserCityEcharts(id, url, option) {
    var myChart = echarts.init(document.getElementById(id));
    myChart.showLoading();

    var flag = loadUserCityData(url, option);
    console.log(flag);
    if (flag) {
        setTimeout(function () {
            myChart.hideLoading();
        }, 1000);
        myChart.setOption(option);
    }
}

function loadUserCityData(url, option) {
    var flag = false;
    $.ajax({
        type: "post",
        async: false,
        url: url,
        dataType: "json",
        success: function success(result) {
            flag = true;
            option.series[0].data = [];
            for (var i = result.data.length - 1; i >= 0; i--) {
                option.series[0].data.push(result.data[i]);
                console.log(result.data[i]);
            }
            result.data.sort(function(a, b) {return a.value - b.value;});
            console.log(result);

        }
    });
    return flag;
}