$(document).ready(function () {
    $.ajax({
        url: "http://localhost/Projet2/modele/jsonG/graphTaille.php",
        method: "GET",
        success: function (data) {
                console.log(data);
                var espece = [];
                var taille = [];

                for(var i = 0; i<=11; i++) {
                    espece.push(data[i].nomEspece);
                    taille.push(data[i].tMoyenne);
            }

             var chartdata = {
                    labels: espece,
                    datasets : [
                        {
                            label: 'Taille Moyenne',
                            backgroundColor: 'rgba(200, 200, 200, 0.75)',
                            borderColor: 'rgba(200, 200, 200, 0.75)',
                            hoverBackgroundColor: 'rgba(200, 200, 200, 1)',
                            hoverBorderColor: 'rgba(200, 200, 200, 1)',
                            data: taille
                        }
                    ]
             };
             var ctx = $('#tailleEsp');
             var barGraph = new Chart(ctx, {
                type: 'bar',
                data: chartdata
             });
        },
        error: function (data) {
            console.log(data);
        }
    });
});

