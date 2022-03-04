# automatically generated by the FlatBuffers compiler, do not modify

# namespace: FlatBufTaskGraph

import flatbuffers
from flatbuffers.compat import import_numpy
np = import_numpy()

class Rings(object):
    __slots__ = ['_tab']

    @classmethod
    def GetRootAs(cls, buf, offset=0):
        n = flatbuffers.encode.Get(flatbuffers.packer.uoffset, buf, offset)
        x = Rings()
        x.Init(buf, n + offset)
        return x

    @classmethod
    def GetRootAsRings(cls, buf, offset=0):
        """This method is deprecated. Please switch to GetRootAs."""
        return cls.GetRootAs(buf, offset)
    # Rings
    def Init(self, buf, pos):
        self._tab = flatbuffers.table.Table(buf, pos)

    # Rings
    def Ringsz(self):
        o = flatbuffers.number_types.UOffsetTFlags.py_type(self._tab.Offset(4))
        if o != 0:
            return self._tab.Get(flatbuffers.number_types.Uint64Flags, o + self._tab.Pos)
        return 0

    # Rings
    def Ringpaths(self, j):
        o = flatbuffers.number_types.UOffsetTFlags.py_type(self._tab.Offset(6))
        if o != 0:
            x = self._tab.Vector(o)
            x += flatbuffers.number_types.UOffsetTFlags.py_type(j) * 4
            x = self._tab.Indirect(x)
            from FlatBufTaskGraph.RingDescriptor import RingDescriptor
            obj = RingDescriptor()
            obj.Init(self._tab.Bytes, x)
            return obj
        return None

    # Rings
    def RingpathsLength(self):
        o = flatbuffers.number_types.UOffsetTFlags.py_type(self._tab.Offset(6))
        if o != 0:
            return self._tab.VectorLen(o)
        return 0

    # Rings
    def RingpathsIsNone(self):
        o = flatbuffers.number_types.UOffsetTFlags.py_type(self._tab.Offset(6))
        return o == 0

def Start(builder): builder.StartObject(2)
def RingsStart(builder):
    """This method is deprecated. Please switch to Start."""
    return Start(builder)
def AddRingsz(builder, ringsz): builder.PrependUint64Slot(0, ringsz, 0)
def RingsAddRingsz(builder, ringsz):
    """This method is deprecated. Please switch to AddRingsz."""
    return AddRingsz(builder, ringsz)
def AddRingpaths(builder, ringpaths): builder.PrependUOffsetTRelativeSlot(1, flatbuffers.number_types.UOffsetTFlags.py_type(ringpaths), 0)
def RingsAddRingpaths(builder, ringpaths):
    """This method is deprecated. Please switch to AddRingpaths."""
    return AddRingpaths(builder, ringpaths)
def StartRingpathsVector(builder, numElems): return builder.StartVector(4, numElems, 4)
def RingsStartRingpathsVector(builder, numElems):
    """This method is deprecated. Please switch to Start."""
    return StartRingpathsVector(builder, numElems)
def End(builder): return builder.EndObject()
def RingsEnd(builder):
    """This method is deprecated. Please switch to End."""
    return End(builder)