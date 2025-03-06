package com.nativeviewsworkshops

import android.content.Context
import android.util.AttributeSet
import com.facebook.react.bridge.ReactContext
import com.facebook.react.bridge.WritableMap
import com.facebook.react.bridge.WritableNativeMap
import com.facebook.react.uimanager.UIManagerHelper
import com.facebook.react.uimanager.events.Event
import org.maplibre.android.camera.CameraPosition
import org.maplibre.android.camera.CameraUpdate
import org.maplibre.android.camera.CameraUpdateFactory
import org.maplibre.android.geometry.LatLng
import org.maplibre.android.gestures.MoveGestureDetector
import org.maplibre.android.maps.MapLibreMap
import org.maplibre.android.maps.MapView

class NativeViewsWorkshopsView :
  MapView,
  MapLibreMap.OnMoveListener,
  MapLibreMap.OnMapClickListener
{
  constructor(context: Context) : super(context)
  constructor(context: Context, attrs: AttributeSet) : super(context, attrs)
  constructor(context: Context, attrs: AttributeSet, defStyleAttr: Int) : super(
    context,
    attrs,
    defStyleAttr
  )

  private val key = "6CHxX3uEpovRRtCpi1ej"
  private val satelliteStyle = "https://api.maptiler.com/maps/satellite/style.json?key=$key"
  private val streetStyle = "https://api.maptiler.com/maps/streets/style.json?key=$key"

  init {
    getMapAsync { map ->
      map.addOnMoveListener(this)
      map.addOnMapClickListener(this)
    }
    setStyle("standard")
  }

  fun setStyle(style: String) {
    if (style == "satellite") {
      getMapAsync { map -> map.setStyle(satelliteStyle) }
    } else {
      getMapAsync { map -> map.setStyle(streetStyle) }
    }
  }

  override fun onMoveBegin(data: MoveGestureDetector) {
    onMove(data)
  }

  override fun onMove(data: MoveGestureDetector) {
    getMapAsync { map ->
      val position = map.cameraPosition.target
      if (position != null) {
        emitEvent(EventType.REGION_CHANGE, position)
      }
    }
  }

  override fun onMoveEnd(data: MoveGestureDetector) {
    onMove(data)
  }

  override fun onMapClick(data: LatLng): Boolean {
    emitEvent(EventType.PRESS, data)
    return true
  }

  private fun emitEvent(eventType: EventType, position: LatLng) {
    val eventDispatcher =
      UIManagerHelper.getEventDispatcherForReactTag(context as ReactContext, id)
    val surfaceId: Int = UIManagerHelper.getSurfaceId(context)
    val data = WritableNativeMap()
    data.putDouble("latitude", position.latitude)
    data.putDouble("longitude", position.longitude)
    val event = MapEvent(surfaceId, id, EventType.getName(eventType), data)
    eventDispatcher!!.dispatchEvent(event)
  }

  private class MapEvent(surfaceId: Int, viewId: Int, val name: String, val data: WritableMap)
    : Event<MapEvent>(surfaceId, viewId) {

    override fun getEventName(): String {
      return name
    }

    override fun getEventData(): WritableMap {
      return data
    }
  }

  enum class EventType {
    PRESS,
    REGION_CHANGE;

    companion object {
      fun getName(type: EventType): String {
        return when (type) {
          PRESS -> "onPress"
          REGION_CHANGE -> "onRegionChange"
        }
      }
    }
  }

  fun moveTo(position: LatLng, animated: Boolean) {
    getMapAsync { map ->
      val cameraPosition = map.cameraPosition
      val newCameraPosition = CameraUpdateFactory.CameraPositionUpdate(
        cameraPosition.bearing,
        position,
        cameraPosition.zoom,
        cameraPosition.tilt,
        cameraPosition.padding
      )
      if (animated) {
        map.animateCamera(newCameraPosition)
      } else {
        map.moveCamera(newCameraPosition)
      }
    }
  }
}
