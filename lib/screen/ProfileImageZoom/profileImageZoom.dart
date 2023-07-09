import 'package:apnishaadi/screen/ProfileImageZoom/profile_image_bloc.dart';
import 'package:apnishaadi/screen/ProfileImageZoom/profile_image_event.dart';
import 'package:apnishaadi/utils/color.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:apnishaadi/utils/next_screen.dart';
class ProfileImageZoomScreen extends StatefulWidget {
  const ProfileImageZoomScreen({Key? key, required this.profileImg})
      : super(key: key);
  final List<String> profileImg;

  @override
  State<ProfileImageZoomScreen> createState() => _ProfileImageZoomScreenState();
}

class _ProfileImageZoomScreenState extends State<ProfileImageZoomScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    int _currentIndex =1;
    int firstPage = 0;
    PageController _pageController = PageController(initialPage: firstPage);
    return Scaffold(
      backgroundColor: Colors.black,
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Stack(children: [

          PhotoViewGallery.builder(
            scrollPhysics: const BouncingScrollPhysics(),
            itemCount: widget.profileImg.length,
            builder: (BuildContext context, int index) {
              return PhotoViewGalleryPageOptions(
                minScale: PhotoViewComputedScale.contained * 0.8,
                maxScale: PhotoViewComputedScale.covered * 2,
                imageProvider: NetworkImage(widget.profileImg[index]),
                initialScale: PhotoViewComputedScale.contained,
              );
            },
            loadingBuilder: (context,event)=> Container(
              alignment: Alignment.center,
              width: size.width,
              height: size.height,
              color: kTextColor,
              child: Container(color: kTextColor,width: 20,height: 20,child:const CircularProgressIndicator(color: Colors.lightGreenAccent,),),
            ),
            pageController: _pageController,
            onPageChanged: (int index) {

                context.read<ProfileImageBloc>().add(ProfileImageIncressAndDcressEvent(index+1));
                print(index.toString());

            },
          ),
            Align(alignment: Alignment.topRight,
            child: InkWell(
              onTap: (){
                backScreen(context);
              },
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 50),
                  child:const Icon(Icons.close,color: Colors.white,)),
            ),),

          Align(alignment: Alignment.topCenter,
            child: InkWell(
              onTap: (){
                backScreen(context);
              },
              child:  BlocBuilder<ProfileImageBloc,int>(builder: (context, status) {
                return Container(
                margin: const EdgeInsets.symmetric(vertical: 50),
                padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                decoration: const BoxDecoration(
                  color: Color(0x80000000),
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child:Text(status.toString()+" of "+widget.profileImg.length.toString(),style:const TextStyle(color: Colors.white,),));
              }),

            ),),
        ],),
        /*child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: widget.profileImg.length,
            itemBuilder: (context, index) {
              return Container(
                width: size.width,
                height: size.height,
                child: CachedNetworkImage(
                  imageUrl: widget.profileImg[index].toString(),
                  imageBuilder: (context, imageProvider) => Container(
                    width: size.width,
                    height: size.height,
                    decoration: BoxDecoration(
                      color: kTextColor,
                      image: DecorationImage(
                        image: imageProvider,
                      ),
                    ),
                  ),
                  placeholder: (context, url) => Container(
                    alignment: Alignment.center,
                    width: size.width,
                    height: size.height,
                    color: kTextColor,
                    child: Container(   color: kTextColor,width: 20,height: 20,child:const CircularProgressIndicator(color: Colors.lightGreenAccent,),),
                  ),
                  errorWidget: (context, url, error) => Container(
                    width: size.width,
                    height: size.height,
                    decoration: BoxDecoration(
                      color: kTextColor,
                      image:const DecorationImage(
                        image: AssetImage("assets/images/girl3.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              );
            }),*/
      ),
    );
  }
}
