import 'package:truequealo/domain/entities/entities.dart';

final List<Post> testingPosts = [
  Post(
      id: 'p1',
      createdBy: user1,
      createdAt: DateTime.now().subtract(Duration(days: 1)),
      portraitImage: 'https://random.imagecdn.app/500/300',
      images: ['https://random.imagecdn.app/500/300'],
      location: 'New York',
      description: 'This is a sample post.',
      title: 'Sample Post 1',
      likes: 5,
      likedBy: [user1, user2],
      commentsAmount: 2,
      comments: [comment1, comment2],
      categoriesIds: [1, 2]),
  Post(
      id: 'p2',
      createdBy: user2,
      createdAt: DateTime.now().subtract(Duration(days: 2)),
      portraitImage: 'https://random.imagecdn.app/500/300',
      images: ['https://random.imagecdn.app/500/300'],
      location: 'Los Angeles',
      description: 'Another sample post.',
      title: 'Sample Post 2',
      likes: 3,
      likedBy: [user1],
      commentsAmount: 1,
      comments: [comment1],
      categoriesIds: [1, 3]),
  Post(
    id: 'p3',
    createdBy: user1,
    createdAt: DateTime.now().subtract(Duration(days: 3)),
    portraitImage: 'https://random.imagecdn.app/500/300',
    images: ['https://random.imagecdn.app/500/300'],
    location: 'Chicago',
    description: 'Yet another sample post.',
    title: 'Sample Post 3',
    likes: 7,
    likedBy: [user2],
    commentsAmount: 0,
    comments: [],
    categoriesIds: [2, 3],
  ),
  Post(
      id: 'p4',
      createdBy: user2,
      createdAt: DateTime.now().subtract(Duration(days: 4)),
      portraitImage: 'https://random.imagecdn.app/500/300',
      images: ['https://random.imagecdn.app/500/300'],
      location: 'Miami',
      description: 'This is the fourth sample post.',
      title: 'Sample Post 4',
      likes: 2,
      likedBy: [],
      commentsAmount: 0,
      comments: [],
      categoriesIds: [4, 8]),
  Post(
    id: 'p5',
    createdBy: user1,
    createdAt: DateTime.now().subtract(Duration(days: 5)),
    portraitImage: 'https://random.imagecdn.app/500/300',
    images: ['https://random.imagecdn.app/500/300'],
    location: 'San Francisco',
    description: 'The final sample post.',
    title: 'Sample Post 5',
    likes: 4,
    likedBy: [user1, user2],
    commentsAmount: 1,
    comments: [comment2],
    categoriesIds: [6, 9],
  )
];

Comment comment1 = Comment(
  id: 'c1',
  content: 'Great post!',
  authorId: 'u1',
  createdAt: DateTime.now().subtract(Duration(hours: 1)),
  postId: 'p1',
);

Comment comment2 = Comment(
  id: 'c2',
  content: 'I agree!',
  authorId: 'u2',
  createdAt: DateTime.now().subtract(Duration(hours: 2)),
  postId: 'p1',
  likes: 1,
);

final User user1 = User(
  id: 'u1',
  firstName: 'John',
  lastName: 'Doe',
  email: 'john.doe@example.com',
  password: 'password123',
  dateOfBirth: DateTime(1990, 5, 15),
  phone: '123-456-7890',
  address: address1,
  createdAt: DateTime.now().subtract(Duration(days: 10)),
  profilePicture: 'https://random.imagecdn.app/500/300',
);

final User user2 = User(
  id: 'u2',
  firstName: 'Jane',
  lastName: 'Smith',
  email: 'jane.smith@example.com',
  password: 'securepassword',
  dateOfBirth: DateTime(1985, 8, 22),
  phone: '987-654-3210',
  address: address2,
  createdAt: DateTime.now().subtract(Duration(days: 20)),
  profilePicture: 'https://random.imagecdn.app/500/300',
);

final User user3 = User(
  id: 'u3',
  firstName: 'Alice',
  lastName: 'Johnson',
  email: 'alice.johnson@example.com',
  password: 'alicepass',
  dateOfBirth: DateTime(1992, 3, 10),
  createdAt: DateTime.now().subtract(Duration(days: 30)),
);

final User user4 = User(
  id: 'u4',
  firstName: 'Bob',
  lastName: 'Brown',
  email: 'bob.brown@example.com',
  password: 'bobpassword',
  createdAt: DateTime.now().subtract(Duration(days: 40)),
  profilePicture: 'https://random.imagecdn.app/500/300',
);

final User user5 = User(
  id: 'u5',
  firstName: 'Charlie',
  lastName: 'Davis',
  email: 'charlie.davis@example.com',
  password: 'charliepass',
  dateOfBirth: DateTime(1988, 12, 5),
  phone: '555-123-4567',
  createdAt: DateTime.now().subtract(Duration(days: 50)),
);

Address address1 = Address(city: 'New York', state: 'NY');
Address address2 = Address(city: 'Los Angeles', state: 'CA');
