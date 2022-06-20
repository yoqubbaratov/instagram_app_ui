import 'package:flutter/material.dart';
import 'package:flutter_font_icons/flutter_font_icons.dart';

import '../model/post_model.dart';
import '../model/story_model.dart';

class FeedPage extends StatefulWidget {
  const FeedPage({Key? key}) : super(key: key);

  @override
  State<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  final List<Story> _stories = [
    Story("assets/images/img.png", "Jasmin"),
    Story("assets/images/img_1.png", "Sylvester"),
    Story("assets/images/img_2.png", "Lavina"),
    Story("assets/images/img.png", "Jasmin"),
    Story("assets/images/img_1.png", "Sylvester"),
    Story("assets/images/img_2.png", "Lavina"),
  ];

  final List<Post> _posts = [
    Post(
      userImage: "assets/images/img_1.png",
      userName: "lavina",
      postImage: "assets/images/feed1.png",
      aption: "asdsfjwefhwieufhweufuwhef qwieuhfweihfiuwhfe",
    ),
    Post(
      userImage: "assets/images/img.png",
      userName: "Brain",
      postImage: "assets/images/feed2.png",
      aption: "asdsfjwefhwieu2121212fhweufuwhef qwieuhfweihfiuwhfe",
    ),
    Post(
      userImage: "assets/images/img_2.png",
      userName: "Parpina",
      postImage: "assets/images/feed3.png",
      aption: "asdsfjwefhwieufhweufuwhef qwieuas121212hfweihfiuwhfe",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Divider(),
            // #stories
            Container(
              color: Colors.black,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "Stories",
                    style: TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                  Text(
                    "Watch All",
                    style: TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                ],
              ),
            ),
            // #storyList
            Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(vertical: 10),
              height: 110,
              child: ListView(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                children: _stories.map((story) {
                  return _itemOfStory(story);
                }).toList(),
              ),
            ),
            // #postList
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                itemBuilder: (ctx, i) {
                  return _itemOfPost(_posts[i]);
                },
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _posts.length,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _itemOfPost(Post post) {
    return Container(
      color: Colors.black,
      child: Column(
        children: [
          // #header
          Container(
            color: Colors.black,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(40),
                      child: Image(
                        image: AssetImage(post.userImage),
                        width: 40,
                        height: 40,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(post.userName, style: const TextStyle(color: Colors.grey),),
                  ],
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(SimpleLineIcons.options, color: Colors.grey,),
                ),
              ],
            ),
          ),
          FadeInImage(
            width: MediaQuery.of(context).size.width,
            placeholder: const AssetImage("assets/images/img_3.png"),
            image: AssetImage(post.postImage),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(FontAwesome.heart_o,color: Colors.grey,),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(FontAwesome.comment_o,color: Colors.grey,),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(FontAwesome.send_o,color: Colors.grey,),
                  ),
                ],
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(FontAwesome.bookmark_o,color: Colors.grey,),
              ),
            ],
          ),
          // #tags
          Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.symmetric(horizontal: 14),
            child: RichText(
              softWrap: true,
              overflow: TextOverflow.visible,
              text: const TextSpan(
                children: [
                  TextSpan(
                    text: "Liked by   ",
                    style: TextStyle(color: Colors.grey),
                  ),
                  TextSpan(
                    text: "Ali, ",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text: "Vali, ",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text: "Sardor, ",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text: "Bobur, ",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),

          // #caption
          Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.symmetric(horizontal: 14, vertical: 5),
            child: RichText(
              softWrap: true,
              overflow: TextOverflow.visible,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "${post.userName}  ",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  TextSpan(
                    text: post.aption,
                    style: const TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // #postDate
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 14),
            alignment: Alignment.topLeft,
            child: const Text(
              "June 2022",
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _itemOfStory(Story story) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(70),
            border: Border.all(
              width: 3,
              color: const Color(0xff8e44ad),
            ),
          ),
          child: Container(
            padding: const EdgeInsets.all(2),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(70),
              child: Image(
                image: AssetImage(story.image),
                width: 70,
                height: 70,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(story.name, style: const TextStyle(color: Colors.grey),),
      ],
    );
  }
}
