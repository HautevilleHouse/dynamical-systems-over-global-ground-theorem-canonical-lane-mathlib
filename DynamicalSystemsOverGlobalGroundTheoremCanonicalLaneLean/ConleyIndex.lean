import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsOverGlobalGroundTheoremCanonicalLaneLean

structure IsolatingBlockPackage where
  block : Type u
  flow : block → ℝ → block
  isolationProperty : Prop
  exitSet : Type v
  entrySet : Type w

structure ConleyIndexPackage (I : IsolatingBlockPackage) where
  indexHomotopyType : Type u
  indexDefined : Prop
  continuationProperty : Prop

structure ConleyIndexEvidence {I : IsolatingBlockPackage}
    (C : ConleyIndexPackage I) where
  indexDefinedClosed : C.indexDefined
  continuationPropertyClosed : C.continuationProperty

def ConleyIndexClosed {I : IsolatingBlockPackage} (C : ConleyIndexPackage I) : Prop :=
  C.indexDefined ∧ C.continuationProperty

theorem conley_index_closed_from_evidence {I : IsolatingBlockPackage}
    (C : ConleyIndexPackage I) (E : ConleyIndexEvidence C) : ConleyIndexClosed C := by
  exact And.intro E.indexDefinedClosed E.continuationPropertyClosed

end DynamicalSystemsOverGlobalGroundTheoremCanonicalLaneLean
end HautevilleHouse
