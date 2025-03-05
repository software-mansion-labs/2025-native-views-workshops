package com.nativeviewsworkshops

import android.graphics.Color
import com.facebook.react.module.annotations.ReactModule
import com.facebook.react.uimanager.SimpleViewManager
import com.facebook.react.uimanager.ThemedReactContext
import com.facebook.react.uimanager.ViewManagerDelegate
import com.facebook.react.uimanager.annotations.ReactProp
import com.facebook.react.viewmanagers.NativeViewsWorkshopsViewManagerInterface
import com.facebook.react.viewmanagers.NativeViewsWorkshopsViewManagerDelegate

@ReactModule(name = NativeViewsWorkshopsViewManager.NAME)
class NativeViewsWorkshopsViewManager : SimpleViewManager<NativeViewsWorkshopsView>(),
  NativeViewsWorkshopsViewManagerInterface<NativeViewsWorkshopsView> {
  private val mDelegate: ViewManagerDelegate<NativeViewsWorkshopsView>

  init {
    mDelegate = NativeViewsWorkshopsViewManagerDelegate(this)
  }

  override fun getDelegate(): ViewManagerDelegate<NativeViewsWorkshopsView>? {
    return mDelegate
  }

  override fun getName(): String {
    return NAME
  }

  public override fun createViewInstance(context: ThemedReactContext): NativeViewsWorkshopsView {
    return NativeViewsWorkshopsView(context)
  }

  @ReactProp(name = "color")
  override fun setColor(view: NativeViewsWorkshopsView?, color: String?) {
    view?.setBackgroundColor(Color.parseColor(color))
  }

  companion object {
    const val NAME = "NativeViewsWorkshopsView"
  }
}
