import 'package:api_news_app/constraints/image_manager.dart';
import 'package:api_news_app/models/slider_model.dart';

List<SliderModel> getSliders() {
  List<SliderModel> sliders = [
    SliderModel(image: ImageManager.imageBusiness,name: 'Bow To The Authority of Silenforce'),
    SliderModel(image: ImageManager.imageDataScience,name: 'Bow To The Authority of Silenforce'),
    SliderModel(image: ImageManager.imageEntertaiment,name: 'Bow To The Authority of Silenforce'),
    SliderModel(image: ImageManager.imageGeneral,name: 'Bow To The Authority of SilenforceBow To The Authority of SilenforceBow To The Authority of SilenforceBow To The Authority of SilenforceBow To The Authority of Silenforce'),
    SliderModel(image: ImageManager.imageHealthcare,name: 'Bow To The Authority of Silenforce'),
    SliderModel(image: ImageManager.imageSports,name: 'Bow To The Authority of Silenforce'),
  ];
  return sliders;
}
