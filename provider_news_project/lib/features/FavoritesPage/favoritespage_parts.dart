// favorite_page_parts.dart

part of 'favoritespage_view.dart';

Widget GridViewBuilderMethod(HomePageViewModel homePageViewModel, BuildContext context) {
  return context.read<HomePageViewModel>().favoritelist.isEmpty
      ? GridView.builder(gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2, // Bir satırda iki eleman
      crossAxisSpacing: 8.0, // Yatayda elemanlar arası boşluk
      mainAxisSpacing: 8.0, // Dikeyde elemanlar arası boşluk
    ) ,
    itemCount: 7,
     itemBuilder: (context,index){
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height*0.2,
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.04),
            borderRadius: const BorderRadius.all(Radius.circular(16))
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: MediaQuery.of(context).size.height*0.02,
            
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.04),
              borderRadius: const BorderRadius.all(Radius.circular(16))
            ),
          ),
        ),
      ],
    );
    })
      : GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 8.0,
          ),
          itemCount: context.watch<HomePageViewModel>().favoritelist.length,
          itemBuilder: (context, index) {
            Result result = context.read<HomePageViewModel>().favoritelist[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailPage(result: result),
                  ),
                );
              },
              child: Card(
                child: Stack(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: Image.network(
                            result.image!,
                            height: 90.0,
                            width: 100.0,
                          ),
                        ),
                        Text(
                          result.name!,
                          style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Positioned(
                      top: 1.0,
                      right: 1.0,
                      child: IconButton(
                        icon: Icon(Icons.favorite_border, color: context.watch<HomePageViewModel>().favoritelist.contains(result) == true ? Colors.red : Colors.black),
                        onPressed: () {
                          homePageViewModel.AddfavoriteList(result);
                          print("Favori Listesi ${context.read<HomePageViewModel>().favoritelist.length.toString()}");
                        },
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
}



