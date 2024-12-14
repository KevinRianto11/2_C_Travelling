class Person{
  final String name;
  final String phone;
  final String picture;
  const Person(this.name,this.phone,this.picture);
}

final List<Person> people = 
      _people.map((e) => Person(e['name'] as String,e['phone'] as String,e['picture'] as String)).toList(growable: false);

final List<Map<String,Object>> _people = 
    [
  {
    "_id": "66f846b63e852c10e2445605",
    "index": 0,
    "guid": "eb42e7c1-be05-4e00-a7d0-3157d48ae028",
    "isActive": true,
    "balance": "1,762.10",
    "picture": "http://placehold.it/32x32",
    "age": 26,
    "eyeColor": "blue",
    "name": "Berry Chavez",
    "gender": "male",
    "company": "ZOGAK",
    "email": "berrychavez@zogak.com",
    "phone": "+1 (975) 524-2933",
    "address": "708 Cyrus Avenue, Levant, Michigan, 8829",
    "about": "Minim duis adipisicing voluptate nulla et proident exercitation mollit dolor deserunt voluptate. Est laborum magna veniam ullamco et dolor aute magna tempor commodo mollit cupidatat. Excepteur quis mollit non ipsum. Et aute sit eiusmod elit dolore anim ex dolore officia mollit.\r\n",
    "registered": "2015-04-26T08:10:26 -07:00",
    "latitude": 26.153235,
    "longitude": -37.424032,
    "tags": [
      "dolore",
      "aliqua",
      "incididunt",
      "Lorem",
      "culpa",
      "velit",
      "labore"
    ],
    "friends": [
      {
        "id": 0,
        "name": "Annmarie Owens"
      },
      {
        "id": 1,
        "name": "Rowena Savage"
      },
      {
        "id": 2,
        "name": "Paige Finch"
      }
    ],
    "greeting": "Hello, Berry Chavez! You have 6 unread messages.",
    "favoriteFruit": "apple"
  },
  {
    "_id": "66f846b69b83e5a5eb4a934d",
    "index": 1,
    "guid": "8d803cd7-37ae-42f4-937e-f97dd322b15d",
    "isActive": true,
    "balance": "3,408.16",
    "picture": "http://placehold.it/32x32",
    "age": 23,
    "eyeColor": "brown",
    "name": "Bond Blackwell",
    "gender": "male",
    "company": "PAWNAGRA",
    "email": "bondblackwell@pawnagra.com",
    "phone": "+1 (949) 479-2406",
    "address": "185 Dank Court, Clarksburg, Kansas, 5741",
    "about": "Elit reprehenderit elit cillum mollit ipsum. Dolor est occaecat aliquip duis dolor nisi eu ullamco commodo commodo exercitation fugiat. Aute anim velit deserunt proident veniam aliquip incididunt. Ad ex ipsum occaecat veniam deserunt Lorem mollit duis.\r\n",
    "registered": "2021-09-30T10:01:35 -07:00",
    "latitude": 62.036193,
    "longitude": -95.846729,
    "tags": [
      "irure",
      "aliquip",
      "deserunt",
      "et",
      "consequat",
      "qui",
      "officia"
    ],
    "friends": [
      {
        "id": 0,
        "name": "Ericka Lott"
      },
      {
        "id": 1,
        "name": "Georgina Massey"
      },
      {
        "id": 2,
        "name": "Tyson Lindsay"
      }
    ],
    "greeting": "Hello, Bond Blackwell! You have 2 unread messages.",
    "favoriteFruit": "strawberry"
  },
  {
    "_id": "66f846b66eb4ed669a54cd24",
    "index": 2,
    "guid": "4347944e-37fc-4103-aee9-069af2ff9216",
    "isActive": false,
    "balance": "1,265.07",
    "picture": "http://placehold.it/32x32",
    "age": 37,
    "eyeColor": "blue",
    "name": "Sawyer Herrera",
    "gender": "male",
    "company": "ZENCO",
    "email": "sawyerherrera@zenco.com",
    "phone": "+1 (900) 503-2674",
    "address": "557 Mayfair Drive, Munjor, Alabama, 8694",
    "about": "Magna et Lorem in nostrud sint mollit laborum nostrud. Eiusmod voluptate est cupidatat tempor laborum mollit labore aliquip non aute consectetur ullamco qui. Consectetur quis proident cillum pariatur elit commodo labore proident do pariatur labore labore.\r\n",
    "registered": "2020-09-28T03:41:41 -07:00",
    "latitude": -16.034324,
    "longitude": 70.019794,
    "tags": [
      "consequat",
      "non",
      "ad",
      "amet",
      "exercitation",
      "ut",
      "laborum"
    ],
    "friends": [
      {
        "id": 0,
        "name": "Suzette Ballard"
      },
      {
        "id": 1,
        "name": "Traci Bond"
      },
      {
        "id": 2,
        "name": "Barr Downs"
      }
    ],
    "greeting": "Hello, Sawyer Herrera! You have 1 unread messages.",
    "favoriteFruit": "strawberry"
  },
  {
    "_id": "66f846b6b8acf35df14cc640",
    "index": 3,
    "guid": "906a8d7e-16a0-4d03-be09-649ee9c58e4b",
    "isActive": false,
    "balance": "1,485.57",
    "picture": "http://placehold.it/32x32",
    "age": 21,
    "eyeColor": "green",
    "name": "Lynn Collins",
    "gender": "male",
    "company": "ASIMILINE",
    "email": "lynncollins@asimiline.com",
    "phone": "+1 (956) 467-2891",
    "address": "954 Grant Avenue, Shindler, American Samoa, 7147",
    "about": "Fugiat qui anim elit quis occaecat dolore quis amet aute veniam cillum pariatur consequat ipsum. Qui enim ea nostrud consectetur consectetur fugiat ut dolore consectetur. Qui elit ut commodo Lorem esse aute labore enim non et sint sint.\r\n",
    "registered": "2024-09-16T09:26:39 -07:00",
    "latitude": 31.070807,
    "longitude": -176.036241,
    "tags": [
      "adipisicing",
      "ut",
      "excepteur",
      "voluptate",
      "adipisicing",
      "officia",
      "elit"
    ],
    "friends": [
      {
        "id": 0,
        "name": "Gill Dillard"
      },
      {
        "id": 1,
        "name": "Krystal Anthony"
      },
      {
        "id": 2,
        "name": "Joyce Riley"
      }
    ],
    "greeting": "Hello, Lynn Collins! You have 9 unread messages.",
    "favoriteFruit": "apple"
  },
  {
    "_id": "66f846b68d375bf19f63b118",
    "index": 4,
    "guid": "cae6091e-e859-4044-acd2-9f8cf0c56ec8",
    "isActive": true,
    "balance": "3,528.71",
    "picture": "http://placehold.it/32x32",
    "age": 40,
    "eyeColor": "green",
    "name": "Mendoza Bush",
    "gender": "male",
    "company": "MANGLO",
    "email": "mendozabush@manglo.com",
    "phone": "+1 (935) 536-3001",
    "address": "398 Fulton Street, Logan, Nebraska, 8331",
    "about": "Proident consequat laborum ea enim officia enim ex magna quis non cupidatat et aliquip fugiat. Qui duis ad ex ex enim. Ad sunt ex pariatur reprehenderit velit amet fugiat. Amet sit cupidatat qui amet cupidatat fugiat voluptate cupidatat tempor eu Lorem nisi sint. Duis nulla laboris et ea.\r\n",
    "registered": "2015-08-27T12:33:47 -07:00",
    "latitude": -11.946388,
    "longitude": -40.814932,
    "tags": [
      "veniam",
      "consectetur",
      "veniam",
      "amet",
      "nostrud",
      "pariatur",
      "do"
    ],
    "friends": [
      {
        "id": 0,
        "name": "Freida Nielsen"
      },
      {
        "id": 1,
        "name": "Pickett Curry"
      },
      {
        "id": 2,
        "name": "Larson Keller"
      }
    ],
    "greeting": "Hello, Mendoza Bush! You have 9 unread messages.",
    "favoriteFruit": "apple"
  },
  {
    "_id": "66f846b691d97e6641c4ac85",
    "index": 5,
    "guid": "0367a8af-6f4c-453e-ace0-e497316b8373",
    "isActive": true,
    "balance": "1,341.46",
    "picture": "http://placehold.it/32x32",
    "age": 23,
    "eyeColor": "green",
    "name": "Barnes Short",
    "gender": "male",
    "company": "DIGIGEN",
    "email": "barnesshort@digigen.com",
    "phone": "+1 (828) 428-2705",
    "address": "355 Gerritsen Avenue, Delco, Puerto Rico, 349",
    "about": "Consequat irure Lorem mollit tempor do laborum eu. Quis ullamco amet dolore aute qui proident dolore laboris velit et. Commodo officia ex id dolor consequat cupidatat excepteur eu aliquip minim. Magna pariatur amet non et. Nulla velit minim pariatur laboris quis irure commodo.\r\n",
    "registered": "2021-12-03T06:11:27 -07:00",
    "latitude": 16.511701,
    "longitude": 124.445313,
    "tags": [
      "ipsum",
      "magna",
      "mollit",
      "aute",
      "consequat",
      "commodo",
      "ullamco"
    ],
    "friends": [
      {
        "id": 0,
        "name": "Marlene Boone"
      },
      {
        "id": 1,
        "name": "Monroe Barker"
      },
      {
        "id": 2,
        "name": "Mcclain Larson"
      }
    ],
    "greeting": "Hello, Barnes Short! You have 7 unread messages.",
    "favoriteFruit": "banana"
  },
  {
    "_id": "66f846b6c7664ea4f0bcd64e",
    "index": 6,
    "guid": "1e75d8ff-6cf7-4cdb-8863-223aa6a576b6",
    "isActive": true,
    "balance": "1,630.71",
    "picture": "http://placehold.it/32x32",
    "age": 33,
    "eyeColor": "green",
    "name": "Herman Meadows",
    "gender": "male",
    "company": "INTERFIND",
    "email": "hermanmeadows@interfind.com",
    "phone": "+1 (973) 481-2053",
    "address": "999 Bay Street, Kersey, California, 6951",
    "about": "Duis exercitation minim irure dolore deserunt commodo culpa. Aliqua excepteur nisi dolor adipisicing consectetur aliquip est. Ipsum culpa voluptate Lorem voluptate.\r\n",
    "registered": "2016-12-25T04:05:29 -07:00",
    "latitude": 69.784563,
    "longitude": 127.69789,
    "tags": [
      "dolor",
      "occaecat",
      "ea",
      "ad",
      "elit",
      "qui",
      "nulla"
    ],
    "friends": [
      {
        "id": 0,
        "name": "Isabella Bennett"
      },
      {
        "id": 1,
        "name": "Scott Delacruz"
      },
      {
        "id": 2,
        "name": "Marcy Jordan"
      }
    ],
    "greeting": "Hello, Herman Meadows! You have 3 unread messages.",
    "favoriteFruit": "banana"
  }
  ];
     