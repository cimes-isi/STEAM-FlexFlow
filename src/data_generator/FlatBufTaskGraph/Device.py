# automatically generated by the FlatBuffers compiler, do not modify

# namespace: FlatBufTaskGraph

import flatbuffers
from flatbuffers.compat import import_numpy
np = import_numpy()

class Device(object):
    __slots__ = ['_tab']

    @classmethod
    def GetRootAs(cls, buf, offset=0):
        n = flatbuffers.encode.Get(flatbuffers.packer.uoffset, buf, offset)
        x = Device()
        x.Init(buf, n + offset)
        return x

    @classmethod
    def GetRootAsDevice(cls, buf, offset=0):
        """This method is deprecated. Please switch to GetRootAs."""
        return cls.GetRootAs(buf, offset)
    # Device
    def Init(self, buf, pos):
        self._tab = flatbuffers.table.Table(buf, pos)

    # Device
    def Type(self):
        o = flatbuffers.number_types.UOffsetTFlags.py_type(self._tab.Offset(4))
        if o != 0:
            return self._tab.Get(flatbuffers.number_types.Int16Flags, o + self._tab.Pos)
        return 0

    # Device
    def Deviceid(self):
        o = flatbuffers.number_types.UOffsetTFlags.py_type(self._tab.Offset(6))
        if o != 0:
            return self._tab.Get(flatbuffers.number_types.Uint64Flags, o + self._tab.Pos)
        return 0

    # Device
    def Nodeid(self):
        o = flatbuffers.number_types.UOffsetTFlags.py_type(self._tab.Offset(8))
        if o != 0:
            return self._tab.Get(flatbuffers.number_types.Uint64Flags, o + self._tab.Pos)
        return 0

    # Device
    def Deviceproperty(self):
        o = flatbuffers.number_types.UOffsetTFlags.py_type(self._tab.Offset(10))
        if o != 0:
            return self._tab.Get(flatbuffers.number_types.Uint64Flags, o + self._tab.Pos)
        return 0

    # Device
    def Bandwidth(self):
        o = flatbuffers.number_types.UOffsetTFlags.py_type(self._tab.Offset(12))
        if o != 0:
            return self._tab.Get(flatbuffers.number_types.Uint64Flags, o + self._tab.Pos)
        return 0

def DeviceStart(builder): builder.StartObject(5)
def Start(builder):
    return DeviceStart(builder)
def DeviceAddType(builder, type): builder.PrependInt16Slot(0, type, 0)
def AddType(builder, type):
    return DeviceAddType(builder, type)
def DeviceAddDeviceid(builder, deviceid): builder.PrependUint64Slot(1, deviceid, 0)
def AddDeviceid(builder, deviceid):
    return DeviceAddDeviceid(builder, deviceid)
def DeviceAddNodeid(builder, nodeid): builder.PrependUint64Slot(2, nodeid, 0)
def AddNodeid(builder, nodeid):
    return DeviceAddNodeid(builder, nodeid)
def DeviceAddDeviceproperty(builder, deviceproperty): builder.PrependUint64Slot(3, deviceproperty, 0)
def AddDeviceproperty(builder, deviceproperty):
    return DeviceAddDeviceproperty(builder, deviceproperty)
def DeviceAddBandwidth(builder, bandwidth): builder.PrependUint64Slot(4, bandwidth, 0)
def AddBandwidth(builder, bandwidth):
    return DeviceAddBandwidth(builder, bandwidth)
def DeviceEnd(builder): return builder.EndObject()
def End(builder):
    return DeviceEnd(builder)