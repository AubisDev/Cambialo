// import 'package:truequealo/domain/entities/entities.dart';
//
// final List<Post> testingPosts = [
//   Post(
//       id: 'p1',
//       createdBy: user1,
//       createdAt: DateTime.now().subtract(Duration(days: 1)),
//       portraitImage: 'https://random.imagecdn.app/500/300',
//       images: ['https://random.imagecdn.app/500/300'],
//       location: 'New York',
//       description: 'This is a sample post.',
//       title: 'Sample Post 1',
//       likes: 5,
//       likedBy: [user1, user2],
//       commentsAmount: 2,
//       comments: [comment1, comment2],
//       categoriesIds: [1, 2]),
//   Post(
//       id: 'p2',
//       createdBy: user2,
//       createdAt: DateTime.now().subtract(Duration(days: 2)),
//       portraitImage: 'https://random.imagecdn.app/500/300',
//       images: ['https://random.imagecdn.app/500/300'],
//       location: 'Los Angeles',
//       description: 'Another sample post.',
//       title: 'Sample Post 2 Sample Post 2 Sample Post 2',
//       likes: 3,
//       likedBy: [user1],
//       commentsAmount: 1,
//       comments: [comment1],
//       categoriesIds: [1, 3]),
//   Post(
//     id: 'p3',
//     createdBy: user1,
//     createdAt: DateTime.now().subtract(Duration(days: 3)),
//     portraitImage: 'https://random.imagecdn.app/500/300',
//     images: ['https://random.imagecdn.app/500/300'],
//     location: 'Chicago',
//     description: 'Yet another sample post.',
//     title: 'Sample Post 3',
//     likes: 7,
//     likedBy: [user2],
//     commentsAmount: 0,
//     comments: [],
//     categoriesIds: [2, 3],
//   ),
//   Post(
//       id: 'p4',
//       createdBy: user2,
//       createdAt: DateTime.now().subtract(Duration(days: 4)),
//       portraitImage: 'https://random.imagecdn.app/500/300',
//       images: ['https://random.imagecdn.app/500/300'],
//       location: 'Miami',
//       description: 'This is the fourth sample post.',
//       title: 'Sample Post 4',
//       likes: 2,
//       likedBy: [],
//       commentsAmount: 0,
//       comments: [],
//       categoriesIds: [4, 8]),
//   Post(
//     id: 'p5',
//     createdBy: user1,
//     createdAt: DateTime.now().subtract(Duration(days: 5)),
//     portraitImage: 'https://random.imagecdn.app/500/300',
//     images: ['https://random.imagecdn.app/500/300'],
//     location: 'San Francisco',
//     description: 'The final sample post.',
//     title: 'Sample Post 5',
//     likes: 4,
//     likedBy: [user1, user2],
//     commentsAmount: 1,
//     comments: [comment2],
//     categoriesIds: [6, 9],
//   ),
//   Post(
//     id: 'p6',
//     createdBy: user3,
//     createdAt: DateTime.now().subtract(Duration(days: 3)),
//     portraitImage: 'https://random.imagecdn.app/500/300',
//     images: ['https://random.imagecdn.app/500/300'],
//     location: 'New York',
//     description: 'A sample post from New York.',
//     title: 'New York Post',
//     likes: 5,
//     likedBy: [user1, user2],
//     commentsAmount: 1,
//     comments: [comment2],
//     categoriesIds: [2, 4],
//   ),
//   Post(
//     id: 'p7',
//     createdBy: user4,
//     createdAt: DateTime.now().subtract(Duration(days: 1)),
//     portraitImage: 'https://random.imagecdn.app/500/300',
//     images: ['https://random.imagecdn.app/500/300'],
//     location: 'London',
//     description: 'Another sample post from London.',
//     title: 'London Post',
//     likes: 2,
//     likedBy: [user3],
//     commentsAmount: 1,
//     comments: [comment3],
//     categoriesIds: [1, 5],
//   ),
//   Post(
//     id: 'p8',
//     createdBy: user5,
//     createdAt: DateTime.now().subtract(Duration(hours: 12)),
//     portraitImage: 'https://random.imagecdn.app/500/300',
//     images: ['https://random.imagecdn.app/500/300'],
//     location: 'Paris',
//     description: 'Sample post from Paris.',
//     title: 'Paris Post',
//     likes: 10,
//     likedBy: [user1, user2, user3, user4],
//     commentsAmount: 0,
//     comments: [],
//     categoriesIds: [3, 6],
//   ),
//   Post(
//     id: 'p9',
//     createdBy: user1,
//     createdAt: DateTime.now().subtract(Duration(hours: 6)),
//     portraitImage: 'https://random.imagecdn.app/500/300',
//     images: ['https://random.imagecdn.app/500/300'],
//     location: 'Tokyo',
//     description: 'A sample post from Tokyo.',
//     title: 'Tokyo Post',
//     likes: 7,
//     likedBy: [user2, user4],
//     commentsAmount: 0,
//     comments: [],
//     categoriesIds: [4, 7],
//   ),
//   Post(
//     id: 'p10',
//     createdBy: user2,
//     createdAt: DateTime.now().subtract(Duration(minutes: 30)),
//     portraitImage: 'https://random.imagecdn.app/500/300',
//     images: ['https://random.imagecdn.app/500/300'],
//     location: 'Sydney',
//     description: 'Sample post from Sydney.',
//     title: 'Sydney Post',
//     likes: 1,
//     likedBy: [user5],
//     commentsAmount: 0,
//     comments: [],
//     categoriesIds: [5, 8],
//   ),
//   Post(
//     id: 'p11',
//     createdBy: user4,
//     createdAt: DateTime.now().subtract(Duration(minutes: 5)),
//     portraitImage: 'https://random.imagecdn.app/500/300',
//     images: ['https://random.imagecdn.app/900/600'],
//     location: 'Berlin',
//     description:
//         '''The first item you will go to retrieve will be Moldy Tome Moldy Tome, located in southwestern Hillsbrad among a bunch of hostile murlocs. You will be looking for a blue book in the dirt. It lays near the edge of the water around a hut with 5-7 murlocs around it and 2-4 patrols that will walk past the area.
//
//         If you came from Tarren Mill, the book is the near the 4th hut to the west.
//
//     An easy way to get the Moldy Tome Moldy Tome would be to Soulstone Soulstone yourself, use your  Summon Voidwalker.
//
//     Start by killing the patrols then pull any of the mobs that won't pull everything else out of the hut.
//
//     Once there are around 3-5 mobs left you can simply send your Pet - Voidwalker Pet - Voidwalker and have it use  Suffering. Once all the remaining murlocs are attacking it, you can run in and grab Moldy Tome Moldy Tome.''',
//     title: 'Berlin Update',
//     likes: 3,
//     likedBy: [user1, user5],
//     commentsAmount: 0,
//     comments: [],
//     categoriesIds: [6, 9],
//   ),
//   Post(
//     id: 'p12',
//     createdBy: user5,
//     createdAt: DateTime.now().subtract(Duration(seconds: 30)),
//     portraitImage: 'https://random.imagecdn.app/500/300',
//     images: ['https://random.imagecdn.app/500/300'],
//     location: 'Rome',
//     description: 'Enjoying the sights in Rome.',
//     title: 'Rome Adventures',
//     likes: 8,
//     likedBy: [user1, user2, user3, user4],
//     commentsAmount: 0,
//     comments: [],
//     categoriesIds: [7, 10],
//   ),
//   Post(
//     id: 'p13',
//     createdBy: user1,
//     createdAt: DateTime.now().subtract(Duration(seconds: 15)),
//     portraitImage: 'https://random.imagecdn.app/500/300',
//     images: ['https://random.imagecdn.app/500/300'],
//     location: 'Madrid',
//     description: 'A beautiful day in Madrid.',
//     title: 'Madrid Views',
//     likes: 12,
//     likedBy: [user2, user3, user4, user5],
//     commentsAmount: 0,
//     comments: [],
//     categoriesIds: [8, 11],
//   ),
//   Post(
//     id: 'p14',
//     createdBy: user2,
//     createdAt: DateTime.now().subtract(Duration(seconds: 10)),
//     portraitImage: 'https://random.imagecdn.app/500/300',
//     images: ['https://random.imagecdn.app/500/300'],
//     location: 'Amsterdam',
//     description: 'Canals of Amsterdam.',
//     title: 'Amsterdam trip',
//     likes: 6,
//     likedBy: [user1, user3, user5],
//     commentsAmount: 0,
//     comments: [],
//     categoriesIds: [9, 12],
//   ),
//   Post(
//     id: 'p15',
//     createdBy: user3,
//     createdAt: DateTime.now().subtract(Duration(seconds: 5)),
//     portraitImage: 'https://random.imagecdn.app/500/300',
//     images: ['https://random.imagecdn.app/500/300'],
//     location: 'Lisbon',
//     description: 'Sunset in lisbon',
//     title: 'Lisbon Sunset',
//     likes: 10,
//     likedBy: [user1, user2, user4, user5],
//     commentsAmount: 0,
//     comments: [],
//     categoriesIds: [10, 3],
//   ),
// ];
//
// Comment comment1 = Comment(
//   id: 'c1',
//   content: 'Great post!',
//   authorId: 'u1',
//   createdAt: DateTime.now().subtract(Duration(hours: 1)),
//   postId: 'p1',
// );
// Comment comment2 = Comment(
//   id: 'c2',
//   content: 'I agree!',
//   authorId: 'u2',
//   createdAt: DateTime.now().subtract(Duration(hours: 2)),
//   postId: 'p1',
//   likes: 1,
// );
// Comment comment3 = Comment(
//   id: 'c3',
//   content: 'Nice work!',
//   authorId: user3.id,
//   createdAt: DateTime.now().subtract(Duration(hours: 6)),
//   postId: 'p4',
// );
//
// final User user1 = User(
//   id: 'u1',
//   firstName: 'John',
//   lastName: 'Doe',
//   email: 'john.doe@example.com',
//   password: 'password123',
//   phone: '123-456-7890',
//   createdAt: DateTime.now().subtract(Duration(days: 10)),
//   profilePicture: 'https://random.imagecdn.app/500/300',
// );
// final User user2 = User(
//   id: 'u2',
//   firstName: 'Jane',
//   lastName: 'Smith',
//   email: 'jane.smith@example.com',
//   password: 'securepassword',
//   phone: '987-654-3210',
//   createdAt: DateTime.now().subtract(Duration(days: 20)),
//   profilePicture: 'https://avatar.iran.liara.run/public',
// );
// final User user3 = User(
//   id: 'u3',
//   firstName: 'Alice',
//   lastName: 'Johnson',
//   email: 'alice.johnson@example.com',
//   password: 'alicepass',
//   createdAt: DateTime.now().subtract(Duration(days: 30)),);
// final User user4 = User(
//   id: 'u4',
//   firstName: 'Bob',
//   lastName: 'Brown',
//   email: 'bob.brown@example.com',
//   password: 'bobpassword',
//   createdAt: DateTime.now().subtract(Duration(days: 40)),
//   profilePicture: 'https://random.imagecdn.app/500/300',
// );
// final User user5 = User(
//   id: 'u5',
//   firstName: 'Charlie',
//   lastName: 'Davis',
//   email: 'charlie.davis@example.com',
//   password: 'charliepass',
//   phone: '555-123-4567',
//   createdAt: DateTime.now().subtract(Duration(days: 50)),
// );
