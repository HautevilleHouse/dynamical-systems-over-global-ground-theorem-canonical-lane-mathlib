import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsOverGlobalGroundTheoremCanonicalLaneLean

structure InvariantManifoldPackage {P : PhaseSpacePackage}
    (F : GlobalFlowPDEPackage P) where
  invariantSet : Set P.spaceType
  stability : Prop
  hyperbolicity : Prop
  stableManifold : Prop
  unstableManifold : Prop

structure InvariantManifoldEvidence {P : PhaseSpacePackage}
    {F : GlobalFlowPDEPackage P}
    (I : InvariantManifoldPackage F) where
  stabilityClosed : I.stability
  hyperbolicityClosed : I.hyperbolicity
  stableManifoldClosed : I.stableManifold
  unstableManifoldClosed : I.unstableManifold

def InvariantManifoldClosed {P : PhaseSpacePackage}
    {F : GlobalFlowPDEPackage P}
    (I : InvariantManifoldPackage F) : Prop :=
  I.stability ∧ I.hyperbolicity ∧ I.stableManifold ∧ I.unstableManifold

theorem invariant_manifold_closed_from_evidence
    {P : PhaseSpacePackage} {F : GlobalFlowPDEPackage P}
    (I : InvariantManifoldPackage F)
    (E : InvariantManifoldEvidence I) : InvariantManifoldClosed I := by
  exact And.intro E.stabilityClosed
    (And.intro E.hyperbolicityClosed
      (And.intro E.stableManifoldClosed E.unstableManifoldClosed))

end DynamicalSystemsOverGlobalGroundTheoremCanonicalLaneLean
end HautevilleHouse