/**                                      -*- mode:C++ -*- */

//Include other classes: //gcnl:SymbolTableOfClasses.cpp:555
#include "Uq_10106UrSelf10.h"
#include "Un_102669211BrainSignal10.h"
#include "Ue_10105Empty10.h"

namespace MFM{

//! BrainStem.ulam:9:   virtual Unsigned getBrainSignalCount() { return 0; } // native ;
  template<class EC>
  Ui_Ut_102321u<EC> Uq_1010919BrainStem10<EC>::Uf_9219getBrainSignalCount(const UlamContext<EC>& uc, UlamRef<EC>& ur)
  {

//! BrainStem.ulam:9:   virtual Unsigned getBrainSignalCount() { return 0; } // native ;
    const u32 Uh_5tlreg14 = 0; //gcnl:NodeTerminal.cpp:644
    const u32 Uh_5tlreg15 = _Int32ToUnsigned32(Uh_5tlreg14, 2, 32); //gcnl:NodeCast.cpp:1168
    Ui_Ut_102321u<EC> Uh_5tlval16(Uh_5tlreg15); //gcnl:Node.cpp:2052
    return (Uh_5tlval16); //gcnl:NodeReturnStatement.cpp:404
  } // Uf_9219getBrainSignalCount

//! BrainStem.ulam:11:   virtual BrainSignal getBrainSignal(Unsigned index) { BrainSignal ret; return ret; } // native
  template<class EC>
  Ui_Un_102669211BrainSignal10<EC> Uq_1010919BrainStem10<EC>::Uf_9214getBrainSignal(const UlamContext<EC>& uc, UlamRef<EC>& ur, Ui_Ut_102321u<EC>& Uv_5index)
  {

//! BrainStem.ulam:11:   virtual BrainSignal getBrainSignal(Unsigned index) { BrainSignal ret; return ret; } // native
    Ui_Un_102669211BrainSignal10<EC> Uv_3ret; //gcnl:NodeVarDecl.cpp:1538

//! BrainStem.ulam:11:   virtual BrainSignal getBrainSignal(Unsigned index) { BrainSignal ret; return ret; } // native
    BitVector<66> Uh_3tubv18; //gcnl:Node.cpp:1382
    Uv_3ret.read(Uh_3tubv18); //gcnl:Node.cpp:1399
    Ui_Un_102669211BrainSignal10<EC> Uh_5tuval19(Uh_3tubv18); //gcnl:Node.cpp:2052
    return (Uh_5tuval19); //gcnl:NodeReturnStatement.cpp:404
  } // Uf_9214getBrainSignal

} //MFM

