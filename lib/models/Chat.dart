class Chat {
  final String name, lastMessage, image, time;
  final bool isActive;

  Chat({
    this.name = '',
    this.lastMessage = '',
    this.image = '',
    this.time = '',
    this.isActive = false,
  });
}

List chatsData = [
  Chat(
    name: "Sooraj",
    lastMessage: "Hope you are doing well...",
    image: "assets/images/user.jpeg",
    time: "3m ago",
    isActive: false,
  ),
  Chat(
    name: "Amjad",
    lastMessage: "Hello Amjad! I am...",
    image: "assets/images/user.jpeg",
    time: "8m ago",
    isActive: true,
  ),
  Chat(
    name: "Ramsha",
    lastMessage: "Do you have update...",
    image: "assets/images/user.jpeg",
    time: "5d ago",
    isActive: false,
  ),
  Chat(
    name: "Sajjad",
    lastMessage: "You’re welcome :)",
    image: "assets/images/user.jpeg",
    time: "5d ago",
    isActive: true,
  ),
  Chat(
    name: "Akram",
    lastMessage: "Thanks",
    image: "assets/images/user.jpeg",
    time: "6d ago",
    isActive: false,
  ),
  Chat(
    name: "Rahi",
    lastMessage: "Hope you are doing well...",
    image: "assets/images/user.jpeg",
    time: "3m ago",
    isActive: false,
  ),
  Chat(
    name: "Khushi",
    lastMessage: "I am seding details...",
    image: "assets/images/user.jpeg",
    time: "8m ago",
    isActive: true,
  ),
  Chat(
    name: "Sanjna",
    lastMessage: "Do you have update...",
    image: "assets/images/user.jpeg",
    time: "5d ago",
    isActive: false,
  ),
];
