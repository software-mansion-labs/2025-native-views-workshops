package com.nativeviewsworkshops

import com.facebook.react.module.annotations.ReactModule
import com.facebook.react.uimanager.SimpleViewManager
import com.facebook.react.uimanager.ThemedReactContext
import com.facebook.react.uimanager.ViewManagerDelegate
import com.facebook.react.viewmanagers.NativeViewsWorkshopsViewManagerDelegate
import com.facebook.react.viewmanagers.NativeViewsWorkshopsViewManagerInterface
import org.maplibre.android.MapLibre
import org.maplibre.android.geometry.LatLng


@ReactModule(name = NativeViewsWorkshopsViewManager.NAME)
class NativeViewsWorkshopsViewManager() : SimpleViewManager<NativeViewsWorkshopsView>(),
    NativeViewsWorkshopsViewManagerInterface<NativeViewsWorkshopsView>
{

  private val mDelegate: ViewManagerDelegate<NativeViewsWorkshopsView> =
    NativeViewsWorkshopsViewManagerDelegate(this)

  override fun getDelegate(): ViewManagerDelegate<NativeViewsWorkshopsView> {
    return mDelegate
  }

  override fun getName(): String {
    return NAME
  }

  public override fun createViewInstance(context: ThemedReactContext): NativeViewsWorkshopsView {
    MapLibre.getInstance(context.reactApplicationContext)
    return NativeViewsWorkshopsView(context)
  }

  companion object {
    const val NAME = "NativeViewsWorkshopsView"
  }

  override fun setMapType(view: NativeViewsWorkshopsView, mapType: String?) {
    if (mapType != null) {
      view.setStyle(mapType)
    }
  }

  override fun moveTo(view: NativeViewsWorkshopsView?, latitude: Float, longitude: Float, animated: Boolean) {
    view?.moveTo(LatLng(latitude.toDouble(), longitude.toDouble()), animated)
  }
}
