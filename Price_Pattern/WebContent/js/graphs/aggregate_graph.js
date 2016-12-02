function daily_aggrigation() {

	var chart = c3.generate({
		data : {
			url : '/Price_Pattern/getDetails/aggregateController/',
			mimeType : 'json',
			x : 'x',
			type : 'bar',
			keys : {
				x : 'date', // it's possible to specify 'x' when category axis
				value : [ 'peak_gain', 'peak_loss' ],
			},
			groups : [ [ 'peak_gain', 'peak_loss' ] ],
			colors: {
				peak_gain: '#00ff00',
				peak_loss: '#ff0f0f'
	        },

		},

		zoom : {
			enabled : true,
			rescale : true
		},
		axis : {
			x : {
				type : 'timeseries',
				label : {
					text : 'date',
					position : 'outer-end'
				},
				tick : {
					format : '%Y-%m-%d'
				}
			},

			y : {
				label : {
					text : 'Gain / Loss $',
					position : 'outer-top'
				},
				tick: {
					values: [-990000000,-900000000,-800000000,-700000000,-600000000,-500000000,
					         -400000000,-300000000,-200000000,-100000000,0,
					         100000000,200000000,300000000,400000000,500000000,600000000,700000000,
					         800000000, 900000000,990000000],
	                format: d3.format("$s")
	            }
			}
		},
		tooltip : {
			  format: {
		           value: function (value, ratio, id) {
		        	   var formatMeA = id === 'peak_gain' || id==='peak_loss' ? value = (value/1000000).toFixed(2)+"M$":value;
		        	   return value;
		           }
			}
		},
	});
}