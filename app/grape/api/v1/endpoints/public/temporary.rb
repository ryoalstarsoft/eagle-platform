module API
  module V1
    module Endpoints
      module Public
        class Temporary < Grape::API
          resource :dispatch do
            desc "Return active Dispatch items"
            get do
              respond 200, dispatch_item_list
            end
          end

          resource :trucks do
            desc "Return available Trucks"
            get do
              respond 200, truck_list
            end
          end

          helpers do
            def truck_list
              [
                101,
                102,
                103,
                104,
                105,
                106,
                107,
                108,
                109,
                110,
                111,
                112,
                113,
                114,
                115,
                116,
                117,
                118,
                119,
                120
              ]
            end

            def dispatch_item_list
              [
                {
                  "job_id": "190027-01",
                  "quarry_name": "Pulled From API",
                  "quarry_address": "2165 NW 17th Ave, Miami, FL 33142",
                  "quarry_longitude": -80.224398,
                  "quarry_latitude": 25.7969508,
                  "material": "Blended Fill",
                  "customer_name": "Ozinga",
                  "job_site": "2551 SW 13TH",
                  "haul_rate": 5.3,
                  "quantity": "60-70 Loads",
                  "status": "active",
                  "trucks": [
                    401,
                    402,
                    403,
                    404
                  ],
                  "dispatched_trucks": [],
                  "date": "12-01-2018"
                },
                {
                  "job_id": "190028-01",
                  "quarry_name": "Eagle / Persant",
                  "quarry_address": "2165 NW 17th Ave, Miami, FL 33142",
                  "material": "Blended Fill",
                  "customer_name": "Ozinga",
                  "job_site": "2551 SW 13TH",
                  "haul_rate": 5.3,
                  "quantity": "60-70 Loads",
                  "status": "active",
                  "trucks": [
                    401,
                    402,
                    403,
                    404
                  ],
                  "dispatched_trucks": [],
                  "date": "12-01-2018"
                },
                {
                  "job_id": "190028-02",
                  "quarry_name": "Eagle / Persant",
                  "quarry_address": "2165 NW 17th Ave, Miami, FL 33142",
                  "quarry_longitude": -80.224398,
                  "quarry_latitude": 25.7969508,
                  "material": "Blended Fill",
                  "customer_name": "Ozinga",
                  "job_site": "2551 SW 13TH",
                  "haul_rate": 5.3,
                  "quantity": "60-70 Loads",
                  "status": "active",
                  "trucks": [
                    401,
                    402,
                    403,
                    404
                  ],
                  "dispatched_trucks": [],
                  "date": "12-01-2018"
                },
                {
                  "job_id": 1237,
                  "quarry_name": "Eagle / Persant",
                  "quarry_address": "2165 NW 17th Ave, Miami, FL 33142",
                  "quarry_longitude": -80.224398,
                  "quarry_latitude": 25.7969508,
                  "material": "Blended Fill",
                  "customer_name": "Ozinga",
                  "job_site": "2551 SW 13TH",
                  "haul_rate": 5.3,
                  "quantity": "60-70 Loads",
                  "status": "active",
                  "trucks": [
                    401,
                    402,
                    403,
                    404
                  ],
                  "dispatched_trucks": [],
                  "date": "12-01-2018"
                },
                {
                  "job_id": 1238,
                  "quarry_name": "Eagle / Persant",
                  "quarry_address": "2165 NW 17th Ave, Miami, FL 33142",
                  "quarry_longitude": -80.224398,
                  "quarry_latitude": 25.7969508,
                  "material": "Blended Fill",
                  "customer_name": "Ozinga",
                  "job_site": "2551 SW 13TH",
                  "haul_rate": 5.3,
                  "quantity": "60-70 Loads",
                  "status": "active",
                  "trucks": [
                    401,
                    402,
                    403,
                    404
                  ],
                  "dispatched_trucks": [],
                  "date": "12-01-2018"
                },
                {
                  "job_id": 1239,
                  "quarry_name": "Eagle / Persant",
                  "quarry_address": "2165 NW 17th Ave, Miami, FL 33142",
                  "quarry_longitude": -80.224398,
                  "quarry_latitude": 25.7969508,
                  "material": "Blended Fill",
                  "customer_name": "Ozinga",
                  "job_site": "2551 SW 13TH",
                  "haul_rate": 5.3,
                  "quantity": "60-70 Loads",
                  "status": "active",
                  "trucks": [
                    401,
                    402,
                    403,
                    404
                  ],
                  "dispatched_trucks": [],
                  "date": "12-01-2018"
                },
                {
                  "job_id": 1240,
                  "quarry_name": "Eagle / Persant",
                  "quarry_address": "2165 NW 17th Ave, Miami, FL 33142",
                  "quarry_longitude": -80.224398,
                  "quarry_latitude": 25.7969508,
                  "material": "Blended Fill",
                  "customer_name": "Ozinga",
                  "job_site": "2551 SW 13TH",
                  "haul_rate": 5.3,
                  "quantity": "60-70 Loads",
                  "status": "active",
                  "trucks": [
                    401,
                    402,
                    403,
                    404
                  ],
                  "dispatched_trucks": [],
                  "date": "12-11-2018"
                },
                {
                  "job_id": 1241,
                  "quarry_name": "Eagle / Persant",
                  "quarry_address": "2165 NW 17th Ave, Miami, FL 33142",
                  "quarry_longitude": -80.224398,
                  "quarry_latitude": 25.7969508,
                  "material": "Blended Fill",
                  "customer_name": "Ozinga",
                  "job_site": "2551 SW 13TH",
                  "haul_rate": 5.3,
                  "quantity": "60-70 Loads",
                  "status": "active",
                  "trucks": [
                    401,
                    402,
                    403,
                    404
                  ],
                  "dispatched_trucks": [],
                  "date": "12-11-2018"
                },
                {
                  "job_id": 1242,
                  "quarry_name": "Eagle / Persant",
                  "quarry_address": "2165 NW 17th Ave, Miami, FL 33142",
                  "quarry_longitude": -80.224398,
                  "quarry_latitude": 25.7969508,
                  "material": "Blended Fill",
                  "customer_name": "Ozinga",
                  "job_site": "2551 SW 13TH",
                  "haul_rate": 5.3,
                  "quantity": "60-70 Loads",
                  "status": "active",
                  "trucks": [
                    401,
                    402,
                    403,
                    404
                  ],
                  "dispatched_trucks": [],
                  "date": "12-11-2018"
                },
                {
                  "job_id": 1243,
                  "quarry_name": "Eagle / Persant",
                  "quarry_address": "2165 NW 17th Ave, Miami, FL 33142",
                  "quarry_longitude": -80.224398,
                  "quarry_latitude": 25.7969508,
                  "material": "Blended Fill",
                  "customer_name": "Ozinga",
                  "job_site": "2551 SW 13TH",
                  "haul_rate": 5.3,
                  "quantity": "60-70 Loads",
                  "status": "active",
                  "trucks": [
                    401,
                    402,
                    403,
                    404
                  ],
                  "dispatched_trucks": [],
                  "date": "12-11-2018"
                },
                {
                  "job_id": 1244,
                  "quarry_name": "Eagle / Persant",
                  "quarry_address": "2165 NW 17th Ave, Miami, FL 33142",
                  "quarry_longitude": -80.224398,
                  "quarry_latitude": 25.7969508,
                  "material": "Blended Fill",
                  "customer_name": "Ozinga",
                  "job_site": "2551 SW 13TH",
                  "haul_rate": 5.3,
                  "quantity": "60-70 Loads",
                  "status": "active",
                  "trucks": [
                    401,
                    402,
                    403,
                    404
                  ],
                  "dispatched_trucks": [],
                  "date": "12-11-2018"
                },
                {
                  "job_id": 1245,
                  "quarry_name": "Eagle / Persant",
                  "quarry_address": "2165 NW 17th Ave, Miami, FL 33142",
                  "quarry_longitude": -80.224398,
                  "quarry_latitude": 25.7969508,
                  "material": "Blended Fill",
                  "customer_name": "Ozinga",
                  "job_site": "2551 SW 13TH",
                  "haul_rate": 5.3,
                  "quantity": "60-70 Loads",
                  "status": "active",
                  "trucks": [
                    401,
                    402,
                    403,
                    404
                  ],
                  "dispatched_trucks": [],
                  "date": "12-11-2018"
                },
                {
                  "job_id": 1246,
                  "quarry_name": "Eagle / Persant",
                  "quarry_address": "2165 NW 17th Ave, Miami, FL 33142",
                  "quarry_longitude": -80.224398,
                  "quarry_latitude": 25.7969508,
                  "material": "Blended Fill",
                  "customer_name": "Ozinga",
                  "job_site": "2551 SW 13TH",
                  "haul_rate": 5.3,
                  "quantity": "60-70 Loads",
                  "status": "active",
                  "trucks": [
                    401,
                    402,
                    403,
                    404
                  ],
                  "dispatched_trucks": [],
                  "date": "12-11-2018"
                },
                {
                  "job_id": 1247,
                  "quarry_name": "Eagle / Persant",
                  "quarry_address": "2165 NW 17th Ave, Miami, FL 33142",
                  "quarry_longitude": -80.224398,
                  "quarry_latitude": 25.7969508,
                  "material": "Blended Fill",
                  "customer_name": "Ozinga",
                  "job_site": "2551 SW 13TH",
                  "haul_rate": 5.3,
                  "quantity": "60-70 Loads",
                  "status": "active",
                  "trucks": [
                    401,
                    402,
                    403,
                    404
                  ],
                  "dispatched_trucks": [],
                  "date": "12-11-2018"
                },
                {
                  "job_id": 1248,
                  "quarry_name": "Eagle / Persant",
                  "quarry_address": "2165 NW 17th Ave, Miami, FL 33142",
                  "quarry_longitude": -80.224398,
                  "quarry_latitude": 25.7969508,
                  "material": "Blended Fill",
                  "customer_name": "Ozinga",
                  "job_site": "2551 SW 13TH",
                  "haul_rate": 5.3,
                  "quantity": "60-70 Loads",
                  "status": "active",
                  "trucks": [
                    401,
                    402,
                    403,
                    404
                  ],
                  "dispatched_trucks": [],
                  "date": "12-25-2018"
                },
                {
                  "job_id": 3462,
                  "quarry_name": "Vulcan",
                  "quarry_address": "12201 NW 25th St, Miami, FL 33182",
                  "quarry_longitude": -80.3811399,
                  "quarry_latitude": 25.8096306,
                  "material": "FDOT",
                  "customer_name": "S. Dade Landfill",
                  "job_site": "1200 SW 145 AVE",
                  "haul_rate": 3.4,
                  "quantity": "22 Loads",
                  "status": "active",
                  "trucks": [
                    301,
                    302,
                    303,
                    304,
                    305
                  ],
                  "dispatched_trucks": [],
                  "date": "12-25-2018"
                },
                {
                  "job_id": 3478,
                  "quarry_name": "SDI",
                  "quarry_address": "15600 SW 288th St #310, Homestead, FL 33033",
                  "quarry_longitude": -80.4458924,
                  "quarry_latitude": 25.4988285,
                  "material": "Sand Fill",
                  "customer_name": "Paradise Gardens",
                  "job_site": "2551 SW 13TH AVE RD 4 PLACE 2",
                  "haul_rate": 4.4,
                  "quantity": "15 Loads",
                  "status": "active",
                  "trucks": [
                    201,
                    202,
                    203,
                    204,
                    205
                  ],
                  "dispatched_trucks": [],
                  "date": "12-25-2018"
                },
                {
                  "job_id": 1964,
                  "quarry_name": "Brickless",
                  "quarry_address": "12201 NW 25th St, Miami, FL 33182",
                  "quarry_longitude": -80.3811399,
                  "quarry_latitude": 25.8096306,
                  "material": "CLR",
                  "customer_name": "Big Apple Transfer",
                  "job_site": "3900 NW 79 AVE",
                  "haul_rate": 3.8,
                  "quantity": "20 Loads",
                  "status": "active",
                  "trucks": [
                    101,
                    102,
                    103,
                    104
                  ],
                  "dispatched_trucks": [],
                  "date": "12-25-2018"
                },
                {
                  "job_id": 1542,
                  "quarry_name": "Eagle / Persant",
                  "quarry_address": "2165 NW 17th Ave, Miami, FL 33142",
                  "quarry_longitude": -80.224398,
                  "quarry_latitude": 25.7969508,
                  "material": "Blended Fill",
                  "customer_name": "Ozinga",
                  "job_site": "2551 SW 13TH",
                  "haul_rate": 5.3,
                  "quantity": "60-70 Loads",
                  "status": "completed",
                  "trucks": [],
                  "dispatched_trucks": [
                    101,
                    102,
                    103,
                    104,
                    105,
                    106
                  ],
                  "date": "12-25-2018"
                },
                {
                  "job_id": 8765,
                  "quarry_name": "Ozinga",
                  "quarry_address": "12201 NW 25th St, Miami, FL 33182",
                  "quarry_longitude": -80.3811399,
                  "quarry_latitude": 25.8096306,
                  "material": "FDOT",
                  "customer_name": "S. Dade Landfill",
                  "job_site": "1200 SW 145 AVE",
                  "haul_rate": 3.4,
                  "quantity": "22 Loads",
                  "status": "completed",
                  "trucks": [],
                  "dispatched_trucks": [
                    111,
                    114,
                    115,
                    116
                  ],
                  "date": "12-25-2018"
                },
                {
                  "job_id": 1898,
                  "quarry_name": "SDI",
                  "quarry_address": "15600 SW 288th St #310, Homestead, FL 33033",
                  "quarry_longitude": -80.4458924,
                  "quarry_latitude": 25.4988285,
                  "material": "Sand Fill",
                  "customer_name": "Paradise Gardens",
                  "job_site": "2551 SW 13TH AVE RD 4 PLACE 2",
                  "haul_rate": 4.4,
                  "quantity": "15 Loads",
                  "status": "completed",
                  "trucks": [],
                  "dispatched_trucks": [
                    121,
                    122,
                    123,
                    125,
                    126
                  ],
                  "date": "12-25-2018"
                },
                {
                  "job_id": 1854,
                  "quarry_name": "Brickless",
                  "quarry_address": "12201 NW 25th St, Miami, FL 33182",
                  "quarry_longitude": -80.3811399,
                  "quarry_latitude": 25.8096306,
                  "material": "CLR",
                  "customer_name": "Big Apple Transfer",
                  "job_site": "3900 NW 79 AVE",
                  "haul_rate": 3.8,
                  "quantity": "20 Loads",
                  "status": "completed",
                  "trucks": [],
                  "dispatched_trucks": [
                    131,
                    132,
                    133,
                    134,
                    135,
                    136
                  ],
                  "date": "12-25-2018"
                },
                {
                  "job_id": 18234,
                  "quarry_name": "Brickless",
                  "quarry_address": "12201 NW 25th St, Miami, FL 33182",
                  "quarry_longitude": -80.3811399,
                  "quarry_latitude": 25.8096306,
                  "material": "CLR",
                  "customer_name": "Big Apple Transfer",
                  "job_site": "3900 NW 79 AVE",
                  "haul_rate": 3.8,
                  "quantity": "20 Loads",
                  "status": "completed",
                  "trucks": [],
                  "dispatched_trucks": [
                    1131,
                    1132,
                    1133,
                    1134,
                    1135,
                    1136
                  ],
                  "date": "12-25-2018"
                },
                {
                  "job_id": 21854,
                  "quarry_name": "Brickless",
                  "quarry_address": "12201 NW 25th St, Miami, FL 33182",
                  "quarry_longitude": -80.3811399,
                  "quarry_latitude": 25.8096306,
                  "material": "CLR",
                  "customer_name": "Big Apple Transfer",
                  "job_site": "3900 NW 79 AVE",
                  "haul_rate": 3.8,
                  "quantity": "20 Loads",
                  "status": "completed",
                  "trucks": [],
                  "dispatched_trucks": [
                    131,
                    132,
                    133,
                    134,
                    135,
                    136
                  ],
                  "date": "12-25-2018"
                },
                {
                  "job_id": 18549,
                  "quarry_name": "Brickless",
                  "quarry_address": "12201 NW 25th St, Miami, FL 33182",
                  "quarry_longitude": -80.3811399,
                  "quarry_latitude": 25.8096306,
                  "material": "CLR",
                  "customer_name": "Big Apple Transfer",
                  "job_site": "3900 NW 79 AVE",
                  "haul_rate": 3.8,
                  "quantity": "20 Loads",
                  "status": "completed",
                  "trucks": [],
                  "dispatched_trucks": [
                    131,
                    132,
                    133,
                    134,
                    135,
                    136
                  ]
                },
                {
                  "job_id": 18548,
                  "quarry_name": "Brickless",
                  "quarry_address": "12201 NW 25th St, Miami, FL 33182",
                  "quarry_longitude": -80.3811399,
                  "quarry_latitude": 25.8096306,
                  "material": "CLR",
                  "customer_name": "Big Apple Transfer",
                  "job_site": "3900 NW 79 AVE",
                  "haul_rate": 3.8,
                  "quantity": "20 Loads",
                  "status": "completed",
                  "trucks": [],
                  "dispatched_trucks": [
                    131,
                    132,
                    133,
                    134,
                    135,
                    136
                  ],
                  "date": "01-05-2019"
                },
                {
                  "job_id": 18547,
                  "quarry_name": "Brickless",
                  "quarry_address": "12201 NW 25th St, Miami, FL 33182",
                  "quarry_longitude": -80.3811399,
                  "quarry_latitude": 25.8096306,
                  "material": "CLR",
                  "customer_name": "Big Apple Transfer",
                  "job_site": "3900 NW 79 AVE",
                  "haul_rate": 3.8,
                  "quantity": "20 Loads",
                  "status": "completed",
                  "trucks": [],
                  "dispatched_trucks": [
                    131,
                    132,
                    133,
                    134,
                    135,
                    136
                  ],
                  "date": "01-05-2019"
                },
                {
                  "job_id": 18546,
                  "quarry_name": "Brickless",
                  "quarry_address": "12201 NW 25th St, Miami, FL 33182",
                  "quarry_longitude": -80.3811399,
                  "quarry_latitude": 25.8096306,
                  "material": "CLR",
                  "customer_name": "Big Apple Transfer",
                  "job_site": "3900 NW 79 AVE",
                  "haul_rate": 3.8,
                  "quantity": "20 Loads",
                  "status": "completed",
                  "trucks": [],
                  "dispatched_trucks": [
                    131,
                    132,
                    133,
                    134,
                    135,
                    136
                  ],
                  "date": "01-05-2019"
                },
                {
                  "job_id": 18545,
                  "quarry_name": "Brickless",
                  "quarry_address": "12201 NW 25th St, Miami, FL 33182",
                  "quarry_longitude": -80.3811399,
                  "quarry_latitude": 25.8096306,
                  "material": "CLR",
                  "customer_name": "Big Apple Transfer",
                  "job_site": "3900 NW 79 AVE",
                  "haul_rate": 3.8,
                  "quantity": "20 Loads",
                  "status": "completed",
                  "trucks": [],
                  "dispatched_trucks": [
                    131,
                    132,
                    133,
                    134,
                    135,
                    136
                  ],
                  "date": "01-05-2019"
                },
                {
                  "job_id": 18544,
                  "quarry_name": "Brickless",
                  "quarry_address": "12201 NW 25th St, Miami, FL 33182",
                  "quarry_longitude": -80.3811399,
                  "quarry_latitude": 25.8096306,
                  "material": "CLR",
                  "customer_name": "Big Apple Transfer",
                  "job_site": "3900 NW 79 AVE",
                  "haul_rate": 3.8,
                  "quantity": "20 Loads",
                  "status": "completed",
                  "trucks": [],
                  "dispatched_trucks": [
                    131,
                    132,
                    133,
                    134,
                    135,
                    136
                  ],
                  "date": "01-05-2019"
                },
                {
                  "job_id": 18543,
                  "quarry_name": "Brickless",
                  "quarry_address": "12201 NW 25th St, Miami, FL 33182",
                  "quarry_longitude": -80.3811399,
                  "quarry_latitude": 25.8096306,
                  "material": "CLR",
                  "customer_name": "Big Apple Transfer",
                  "job_site": "3900 NW 79 AVE",
                  "haul_rate": 3.8,
                  "quantity": "20 Loads",
                  "status": "completed",
                  "trucks": [],
                  "dispatched_trucks": [
                    131,
                    132,
                    133,
                    134,
                    135,
                    136
                  ],
                  "date": "01-05-2019"
                },
                {
                  "job_id": 18542,
                  "quarry_name": "Brickless",
                  "quarry_address": "12201 NW 25th St, Miami, FL 33182",
                  "quarry_longitude": -80.3811399,
                  "quarry_latitude": 25.8096306,
                  "material": "CLR",
                  "customer_name": "Big Apple Transfer",
                  "job_site": "3900 NW 79 AVE",
                  "haul_rate": 3.8,
                  "quantity": "20 Loads",
                  "status": "completed",
                  "trucks": [],
                  "dispatched_trucks": [
                    131,
                    132,
                    133,
                    134,
                    135,
                    136
                  ],
                  "date": "01-05-2019"
                },
                {
                  "job_id": 18541,
                  "quarry_name": "Brickless",
                  "quarry_address": "12201 NW 25th St, Miami, FL 33182",
                  "quarry_longitude": -80.3811399,
                  "quarry_latitude": 25.8096306,
                  "material": "CLR",
                  "customer_name": "Big Apple Transfer",
                  "job_site": "3900 NW 79 AVE",
                  "haul_rate": 3.8,
                  "quantity": "20 Loads",
                  "status": "completed",
                  "trucks": [],
                  "dispatched_trucks": [
                    131,
                    132,
                    133,
                    134,
                    135,
                    136
                  ],
                  "date": "01-05-2019"
                },
                {
                  "job_id": 18534,
                  "quarry_name": "Brickless",
                  "quarry_address": "12201 NW 25th St, Miami, FL 33182",
                  "quarry_longitude": -80.3811399,
                  "quarry_latitude": 25.8096306,
                  "material": "CLR",
                  "customer_name": "Big Apple Transfer",
                  "job_site": "3900 NW 79 AVE",
                  "haul_rate": 3.8,
                  "quantity": "20 Loads",
                  "status": "completed",
                  "trucks": [],
                  "dispatched_trucks": [
                    131,
                    132,
                    133,
                    134,
                    135,
                    136
                  ],
                  "date": "01-05-2019"
                },
                {
                  "job_id": 11852,
                  "quarry_name": "Brickless",
                  "quarry_address": "12201 NW 25th St, Miami, FL 33182",
                  "quarry_longitude": -80.3811399,
                  "quarry_latitude": 25.8096306,
                  "material": "CLR",
                  "customer_name": "Big Apple Transfer",
                  "job_site": "3900 NW 79 AVE",
                  "haul_rate": 3.8,
                  "quantity": "20 Loads",
                  "status": "completed",
                  "trucks": [],
                  "dispatched_trucks": [
                    131,
                    132,
                    133,
                    134,
                    135,
                    136
                  ],
                  "date": "01-05-2019"
                },
                {
                  "job_id": 11853,
                  "quarry_name": "Brickless",
                  "quarry_address": "12201 NW 25th St, Miami, FL 33182",
                  "quarry_longitude": -80.3811399,
                  "quarry_latitude": 25.8096306,
                  "material": "CLR",
                  "customer_name": "Big Apple Transfer",
                  "job_site": "3900 NW 79 AVE",
                  "haul_rate": 3.8,
                  "quantity": "20 Loads",
                  "status": "completed",
                  "trucks": [],
                  "dispatched_trucks": [
                    131,
                    132,
                    133,
                    134,
                    135,
                    136
                  ],
                  "date": "01-05-2019"
                },
                {
                  "job_id": 11854,
                  "quarry_name": "Brickless",
                  "quarry_address": "12201 NW 25th St, Miami, FL 33182",
                  "quarry_longitude": -80.3811399,
                  "quarry_latitude": 25.8096306,
                  "material": "CLR",
                  "customer_name": "Big Apple Transfer",
                  "job_site": "3900 NW 79 AVE",
                  "haul_rate": 3.8,
                  "quantity": "20 Loads",
                  "status": "completed",
                  "trucks": [],
                  "dispatched_trucks": [
                    131,
                    132,
                    133,
                    134,
                    135,
                    136
                  ],
                  "date": "01-29-2019"
                }
              ]
            end
          end
        end
      end
    end
  end
end