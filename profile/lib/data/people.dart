class Person{
  final String name ;
  final String phone ;
  final String picture ;
  const Person(this.name, this.phone, this.picture);
}

final List<Person> people = _people.map((e) => Person(e['name'] as String, e['phone'] as String, e['picture'] as String)).toList(growable: false);

final List<Map<String,Object>>_people =
[
  {
    "_id": "66fea48101f053ba1a07a247",
    "index": 0,
    "guid": "0b011bdc-5a06-4c3b-b147-02dda4f3378c",
    "isActive": true,
    "name": "Mcpherson Mcfadden",
    "gender": "male",
    "age": 42,
    "licenseNumber": "44a8da97-9688-4bee-a9e4-02e17dd1a86b",
    "vehicle": {
      "make": "Honda",
      "model": "Camry",
      "year": 2018,
      "licensePlate": "ABC123"
    },
    "rating": 4.3,
    "ridesGiven": 201,
    "balance": "3,855.38",
    "phone": "+91 (852) 507-2796",
    "email": "mcphersonmcfadden@velos.com",
    "address": "432 Nichols Avenue, Katonah, Tennessee, 1760",
    "registered": "2017-02-26T12:32:02 -07:00",
    "latitude": 63.720934,
    "longitude": 15.366787,
    "tags": [
      "fugiat",
      "non",
      "aute"
    ],
    "trips": [
      {
        "id": 0,
        "destination": "Madrid",
        "fare": "70.01"
      },
      {
        "id": 1,
        "destination": "Cotopaxi",
        "fare": "80.36"
      },
      {
        "id": 2,
        "destination": "Buxton",
        "fare": "66.10"
      },
      {
        "id": 3,
        "destination": "Jardine",
        "fare": "31.36"
      },
      {
        "id": 4,
        "destination": "Wauhillau",
        "fare": "59.05"
      }
    ],
    "greeting": "Hello, Mcpherson Mcfadden! You have completed 2 trips today."
  },
  {
    "_id": "66fea4811f318330430093cf",
    "index": 1,
    "guid": "79ac687c-e019-4b5d-8e1a-7b4dd867b23a",
    "isActive": false,
    "name": "Chasity Durham",
    "gender": "female",
    "age": 23,
    "licenseNumber": "ecb29f48-8f81-4acf-9bce-a939dc025155",
    "vehicle": {
      "make": "Ford",
      "model": "Model 3",
      "year": 2011,
      "licensePlate": "LMN456"
    },
    "rating": 3.8,
    "ridesGiven": 1896,
    "balance": "2,925.93",
    "phone": "+44 (922) 575-3540",
    "email": "chasitydurham@velos.com",
    "address": "925 Hastings Street, Robinette, West Virginia, 9231",
    "registered": "2016-11-06T08:08:34 -07:00",
    "latitude": -11.315988,
    "longitude": 21.205486,
    "tags": [
      "pariatur",
      "consectetur",
      "mollit"
    ],
    "trips": [
      {
        "id": 0,
        "destination": "Marne",
        "fare": "65.85"
      },
      {
        "id": 1,
        "destination": "Summerfield",
        "fare": "64.33"
      },
      {
        "id": 2,
        "destination": "Drytown",
        "fare": "37.60"
      },
      {
        "id": 3,
        "destination": "Barronett",
        "fare": "6.25"
      },
      {
        "id": 4,
        "destination": "Gardners",
        "fare": "82.39"
      }
    ],
    "greeting": "Hello, Chasity Durham! You have completed 6 trips today."
  },
  {
    "_id": "66fea48124635ba11525355b",
    "index": 2,
    "guid": "daf6e8e0-07fa-49b1-9806-3786930db7e0",
    "isActive": true,
    "name": "Charity Hicks",
    "gender": "female",
    "age": 50,
    "licenseNumber": "7b677776-a3fd-4ca4-8187-a459f8880df3",
    "vehicle": {
      "make": "Honda",
      "model": "Camry",
      "year": 2011,
      "licensePlate": "XYZ789"
    },
    "rating": 1.6,
    "ridesGiven": 2446,
    "balance": "1,363.49",
    "phone": "+1 (958) 467-2655",
    "email": "charityhicks@velos.com",
    "address": "268 Woodside Avenue, Elwood, New Jersey, 9583",
    "registered": "2017-09-03T04:41:56 -07:00",
    "latitude": 83.329418,
    "longitude": 85.372186,
    "tags": [
      "Lorem",
      "mollit",
      "ad"
    ],
    "trips": [
      {
        "id": 0,
        "destination": "Riviera",
        "fare": "8.57"
      },
      {
        "id": 1,
        "destination": "Brownsville",
        "fare": "85.52"
      },
      {
        "id": 2,
        "destination": "Marbury",
        "fare": "26.49"
      },
      {
        "id": 3,
        "destination": "Grill",
        "fare": "26.26"
      },
      {
        "id": 4,
        "destination": "Fairforest",
        "fare": "55.98"
      }
    ],
    "greeting": "Hello, Charity Hicks! You have completed 3 trips today."
  },
  {
    "_id": "66fea481bd60aac7878c6a87",
    "index": 3,
    "guid": "58126a6b-125b-4d05-8208-92b470d1d7f3",
    "isActive": true,
    "name": "Agnes Hale",
    "gender": "female",
    "age": 49,
    "licenseNumber": "1a47d21c-b673-4517-86dd-4666b175e351",
    "vehicle": {
      "make": "Toyota",
      "model": "Impala",
      "year": 2010,
      "licensePlate": "ABC123"
    },
    "rating": 2.7,
    "ridesGiven": 4059,
    "balance": "3,118.02",
    "phone": "+91 (844) 542-3394",
    "email": "agneshale@velos.com",
    "address": "751 Verona Place, Yardville, Arkansas, 2797",
    "registered": "2016-08-30T10:18:17 -07:00",
    "latitude": -61.014863,
    "longitude": 129.327227,
    "tags": [
      "amet",
      "magna",
      "amet"
    ],
    "trips": [
      {
        "id": 0,
        "destination": "Blende",
        "fare": "29.99"
      },
      {
        "id": 1,
        "destination": "Lynn",
        "fare": "25.65"
      },
      {
        "id": 2,
        "destination": "Muir",
        "fare": "58.81"
      },
      {
        "id": 3,
        "destination": "Shindler",
        "fare": "76.96"
      },
      {
        "id": 4,
        "destination": "Efland",
        "fare": "61.62"
      }
    ],
    "greeting": "Hello, Agnes Hale! You have completed 5 trips today."
  },
  {
    "_id": "66fea48152136cc5a20f05eb",
    "index": 4,
    "guid": "791a1bff-608e-4a26-a9fe-323a5b4185dc",
    "isActive": false,
    "name": "Henrietta Lester",
    "gender": "female",
    "age": 34,
    "licenseNumber": "bbfd61b2-3b5f-48d4-884e-2db81991d5ee",
    "vehicle": {
      "make": "Toyota",
      "model": "Mustang",
      "year": 2014,
      "licensePlate": "LMN456"
    },
    "rating": 1.7,
    "ridesGiven": 9434,
    "balance": "2,503.69",
    "phone": "+1 (976) 498-3191",
    "email": "henriettalester@velos.com",
    "address": "165 Boulevard Court, Fivepointville, Palau, 1864",
    "registered": "2015-08-12T08:20:57 -07:00",
    "latitude": -46.297692,
    "longitude": 171.681114,
    "tags": [
      "occaecat",
      "qui",
      "deserunt"
    ],
    "trips": [
      {
        "id": 0,
        "destination": "Abrams",
        "fare": "63.90"
      },
      {
        "id": 1,
        "destination": "Chaparrito",
        "fare": "48.37"
      },
      {
        "id": 2,
        "destination": "Emerald",
        "fare": "70.67"
      },
      {
        "id": 3,
        "destination": "Craig",
        "fare": "83.41"
      },
      {
        "id": 4,
        "destination": "Corriganville",
        "fare": "56.84"
      }
    ],
    "greeting": "Hello, Henrietta Lester! You have completed 9 trips today."
  }
];