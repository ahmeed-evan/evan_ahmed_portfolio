import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

SizedBox customHeight(double value) => SizedBox(height: value);

SizedBox customWeight(double value) => SizedBox(width: value);

TextStyle defaultTxtStyle() => const TextStyle(fontSize: 16);

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class IconIntro {
  String title;
  String iconURL;
  Color color;

  IconIntro({required this.title, required this.iconURL, required this.color});
}

class _MyHomePageState extends State<MyHomePage> {
  final aboutMeKey = GlobalKey();
  bool isSkillShown = true;
  bool isInterestShown = false;
  bool isHobbiesShown = false;

  final List<IconIntro> iconIntroList = [
    IconIntro(
        title: "Developer",
        iconURL: "assets/images/software-development.png",
        color: Colors.greenAccent),
    IconIntro(
        title: "Team Lead",
        iconURL: "assets/images/strategy.png",
        color: Colors.blueAccent),
    IconIntro(
        title: "Innovator",
        iconURL: "assets/images/idea.png",
        color: Colors.orangeAccent),
    IconIntro(
        title: "Entrepreneur",
        iconURL: "assets/images/entrepreneurship.png",
        color: Colors.redAccent),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(slivers: [
        SliverAppBar(
          pinned: true,
          title: _navSection(),
          flexibleSpace: FlexibleSpaceBar(
            background: Container(
              color: Colors.red.shade50,
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: _contents(),
        ),
      ]),
      backgroundColor: Colors.white,
    );
  }

  _contents() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _shortDescribtionOrWorkHistory(),
        customHeight(30),
        Image.asset("assets/images/flutter_developer_image.jpg",
            height: 300, width: 500, fit: BoxFit.fill),
        customHeight(30),
        _iconIntro(),
        customHeight(30),
        _aboutMe(),
        customHeight(60),
        _desButton(),
        customHeight(30),
        _skillAndPersonalInterest(),
        customHeight(50),
        _workHistory(),
      ],
    );
  }

  _shortDescribtionOrWorkHistory() {
    return Container(
      padding: const EdgeInsets.only(top: 20),
      width: MediaQuery.of(context).size.width * .7,
      child: Column(
        children: [
          Text(
            "Evan Ahmed".toUpperCase(),
            style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            textAlign: TextAlign.end,
          ),
          customHeight(10),
          Text(
            "Creative Mobile Application Developer,dedicated to building and optimizing the performance of user- centric,high-impact mobile and web application,good ability to transcribe any UI, good modern tools in Mobile and Web application development.",
            style: defaultTxtStyle(),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  _navSection() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
              child: Row(
            children: [
              const Icon(CupertinoIcons.desktopcomputer,
                  color: Colors.redAccent, size: 20),
              customWeight(8),
              Text(
                "Evan".toUpperCase(),
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                textAlign: TextAlign.end,
              ),
              customWeight(4),
              Text(
                "Ahmed".toUpperCase(),
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                textAlign: TextAlign.end,
              ),
            ],
          )),
          Expanded(
              child: Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            alignment: WrapAlignment.end,
            children: [
              InkWell(
                onTap: () {
                  Scrollable.ensureVisible(aboutMeKey.currentContext!);
                },
                child: Text("About", style: defaultTxtStyle()),
              ),
              customWeight(16),
              Text("Apps", style: defaultTxtStyle()),
              customWeight(16),
              Text("Resume", style: defaultTxtStyle()),
              customWeight(16),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.red, width: 2),
                ),
                child: Text("Contact", style: defaultTxtStyle()),
              )
            ],
          )),
        ],
      ),
    );
  }

  _aboutMe() {
    return Container(
      padding: const EdgeInsets.only(top: 20),
      key: aboutMeKey,
      width: MediaQuery.of(context).size.width * .7,
      child: Row(
        children: [
          Expanded(
            child: Image.asset(
              "assets/images/flutter_developer_image.jpg",
              width: 100,
              height: 150,
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Text(
                  "About me",
                  style: defaultTxtStyle()
                      .copyWith(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                customHeight(10),
                Text(
                  "Experienced mobile application developer with 4 years in the field, adeptly crafting 10+ successful mobile applications. Proficient in diverse domains including Augmented Reality, E-commerce, E-learning and HRM. Skillful in leading development teams, fostering seamless collaboration. Expertly maintains GitHub repository and consistently delivers top-notch results. A dedicated professional with a passion for innovative and efficient mobile solutions.",
                  style: defaultTxtStyle(),
                  textAlign: TextAlign.center,
                ),
                customHeight(20),
                Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    runSpacing: 16,
                    spacing: 16,
                    children: [
                      _containerButton("Github", () {}, Colors.black),
                      _containerButton("Linkedin", () {}, Colors.blue)
                    ]),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _iconIntro() {
    return SizedBox(
      width: MediaQuery.of(context).size.width * .7,
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.start,
        alignment: WrapAlignment.spaceBetween,
        children: iconIntroList
            .map((item) => Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      width: 90,
                      height: 90,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: item.color,
                      ),
                      child: Image.asset(item.iconURL),
                    ),
                    customHeight(10),
                    Text(
                      item.title,
                      style: defaultTxtStyle(),
                    )
                  ],
                ))
            .toList(),
      ),
    );
  }

  _containerButton(String title, Function onPress, Color color) {
    return InkWell(
      onTap: () => onPress,
      child: Container(
        width: 150,
        padding: const EdgeInsets.symmetric(vertical: 6),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16), color: color),
        child: Text(
          title,
          style: defaultTxtStyle().copyWith(color: Colors.white),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  _smallContainerButton(
      String title, Function onPress, IconData iconData, bool clicked) {
    return InkWell(
      onTap: () => onPress(),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: clicked ? Colors.redAccent : Colors.white),
        child: Row(children: [
          Icon(iconData, size: 16),
          customWeight(4),
          Text(
            title,
            style: defaultTxtStyle()
                .copyWith(color: clicked ? Colors.white : Colors.black),
          )
        ]),
      ),
    );
  }

  _skillAndPersonalInterest() {
    return SizedBox(
      width: MediaQuery.of(context).size.width * .7,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Visibility(
            child: _skills(),
            visible: isSkillShown,
          ),
          Visibility(
            child: _interest(),
            visible: isInterestShown,
          ),
          Visibility(
            child: _hobbies(),
            visible: isHobbiesShown,
          ),
        ],
      ),
    );
  }

  _skills() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "• Languages‐ Java, Dart,JavaScript,TypeScript,SQL, XML",
                style: defaultTxtStyle(),
              ),
              customHeight(20),
              Text(
                "• Mobile development ‐ AndroidSDK, Flutter, Flutter Animations, SqfLite,Hive, Provider, Getx, http,Dagger2, Navigation Component,Retrofit, RoomDatabase,MVP/MVVM",
                style: defaultTxtStyle(),
              ),
              customHeight(20),
              Text(
                "• Web development- Vue.Js, HTML , CSS,Bootstrap, Vuetify, Nuxt.Js, Vuex",
                style: defaultTxtStyle(),
              ),
              customHeight(20),
              Text(
                "• BackEnd- Spring Boot, Spring Security, Spring Data JPA, Swagger,Junit",
                style: defaultTxtStyle(),
              ),
              customHeight(20),
              Text(
                "• Database‐Firebase,MySQL,PorstgreSQ",
                style: defaultTxtStyle(),
              ),
              customHeight(20),
              Text(
                "• Software‐ Maven, Git, Docker, Figma, Postman,BitBucket, Xampp, Jira,",
                style: defaultTxtStyle(),
              ),
              customHeight(20),
              Text(
                "• SDLC- Agile & Scrum, OOP",
                style: defaultTxtStyle(),
              ),
            ],
          ),
        ),
        Expanded(child: _sideImage("assets/images/skill_image.jpg")),
      ],
    );
  }

  _interest() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "• Motion Graphics Enthusiast: Passionate about the world of motion graphics, I immerse myself in creating captivating visual experiences through animation and design. Utilizing tools like After Effects and Blender, I craft dynamic visuals that bring ideas to life.",
                style: defaultTxtStyle(),
              ),
              customHeight(20),
              Text(
                "• Video Editing Aficionado: With a keen eye for detail, I excel in video editing. From stitching together clips to enhancing storytelling with seamless transitions, I merge creativity and technical skill using software like Premiere Pro. I relish the process of transforming raw footage into compelling narratives.",
                style: defaultTxtStyle(),
              ),
              customHeight(20),
              Text(
                "• Exploring Human Behavior through Books: Fascinated by the complexities of human nature, I delve into a variety of books on psychology and sociology. Through literature, I gain insights into the intricacies of behavior, motivations, and emotions. This knowledge enriches both my creative work and my understanding of the world around me.",
                style: defaultTxtStyle(),
              ),
            ],
          ),
        ),
        Expanded(
            child: _sideImage("assets/images/22343631_Content creator editing video footage in studio.jpg")),
      ],
    );
  }

  _hobbies() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "• A passionate guitarist, I lose myself in soulful melodies, strumming stories across frets. From acoustic serenades to electric energy, my fingers dance, weaving emotions into music.",
                style: defaultTxtStyle(),
              ),
              customHeight(20),
              Text(
                "• Beyond the strings, I immerse myself in virtual realms, a gamer exploring diverse worlds. Quick reflexes and strategic thinking combine, painting my adventures with pixels and passion.",
                style: defaultTxtStyle(),
              ),
            ],
          ),
        ),
        Expanded(
            child: _sideImage("assets/images/16503741_37Z_2105.w007.n001.17B.p12.17.jpg")),
      ],
    );
  }

  _desButton() {
    return SizedBox(
      width: MediaQuery.of(context).size.width * .7,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _smallContainerButton("Skill", () {
            setState(() {
              isSkillShown = true;
              isInterestShown = false;
              isHobbiesShown = false;
            });
          }, Icons.workspace_premium_outlined, isSkillShown),
          _smallContainerButton("Interest", () {
            setState(() {
              isSkillShown = false;
              isInterestShown = true;
              isHobbiesShown = false;
            });
          }, Icons.interests, isInterestShown),
          _smallContainerButton("Hobbies", () {
            setState(() {
              isSkillShown = false;
              isInterestShown = false;
              isHobbiesShown = true;
            });
          }, CupertinoIcons.guitars, isHobbiesShown),
        ],
      ),
    );
  }

  _sideImage(String imageUrl) {
    return SizedBox(
      height: 300,
      child: Image.asset(
        fit: BoxFit.cover,
        imageUrl,
      ),
    );
  }

  _workHistory() {
    return SizedBox(
      width: MediaQuery.of(context).size.width*.7,
      child: Text("Hello"),
    );
  }
}
