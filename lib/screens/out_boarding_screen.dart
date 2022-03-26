import 'package:flutter/material.dart';
import 'package:vp12_ui_application/widgets/out_boarding_content.dart';
import 'package:vp12_ui_application/widgets/out_boarding_indicator.dart';

class OutBoardingScreen extends StatefulWidget {
  const OutBoardingScreen({Key? key}) : super(key: key);

  @override
  _OutBoardingScreenState createState() => _OutBoardingScreenState();
}

class _OutBoardingScreenState extends State<OutBoardingScreen> {
  late PageController _pageController;
  int _currentPage=0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController = PageController();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    _pageController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Align(
              alignment: AlignmentDirectional.topEnd,
                child: Visibility(
                  visible: _currentPage<2,
                  child: TextButton(onPressed: (){
                    _pageController.animateToPage(2,
                        duration: const Duration(seconds: 1),
                        curve: Curves.easeIn
                    );
                  },
                      child: const Text('SKIP'),
                  ),
                  replacement: TextButton(onPressed: (){},child: const Text('START'),),
                ),
            ),
            Expanded(
              child: PageView(
                controller : _pageController,
                scrollDirection: Axis.horizontal,
                onPageChanged: (int page){
                  setState(() {
                    _currentPage = page;
                  }
                  );
                },
                children:  const [
                   OutBoardingContent(
                     title: 'Welcome!',
                     subTitle: 'Now were up in the big leagues gettingour turn at bat. The Brady Bunch that\'s the way we  Brady Bunch.. ',
                   ),
                   OutBoardingContent(title: 'Add to cart',subTitle: 'Now were up in the big leagues gettingour turn at bat. The Brady Bunch that\'s the way we  Brady Bunch.. ',),
                   OutBoardingContent(title: 'Enjoy burchese',subTitle: 'Now were up in the big leagues gettingour turn at bat. The Brady Bunch that\'s the way we  Brady Bunch.. ',),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OutBoardingIndicator(marginEnd: 14,selected: _currentPage==0,),
                OutBoardingIndicator(marginEnd:14,selected: _currentPage==1,),
                OutBoardingIndicator(selected: _currentPage==2,),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Visibility(
                  visible: _currentPage!=0,
                  maintainSize: true,
                  maintainState: true,
                  maintainAnimation: true,
                  child: IconButton(onPressed: (){
                    _pageController.previousPage(duration: const Duration(seconds: 1), curve: Curves.easeInCirc);
                  }, icon: const Icon(Icons.arrow_back_ios_rounded)
                  ),
                ),
                Visibility(
                  visible: _currentPage!=2,
                  maintainAnimation: true,
                  maintainSize: true,
                  maintainState: true,
                  child: IconButton(onPressed: (){
                    _pageController.nextPage(duration: const Duration(seconds: 1), curve: Curves.easeInCirc);

                  }, icon: const Icon(Icons.arrow_forward_ios_rounded),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40,),
            Visibility(
              visible: _currentPage==2,
                maintainState: true,
                maintainAnimation: true,
                maintainSize: true,
                child: ElevatedButton(onPressed: ()=>Navigator.pushReplacementNamed(context, '/login_screen'), child: const Text('START'))),
            const SizedBox(height: 20,),
          ],
        ),
      ),
    );
  }
}
