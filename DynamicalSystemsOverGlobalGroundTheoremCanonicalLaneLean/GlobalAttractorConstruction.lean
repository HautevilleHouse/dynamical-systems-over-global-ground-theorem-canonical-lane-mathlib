import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsOverGlobalGroundTheoremCanonicalLaneLean

structure GlobalAttractorPackage {P : PhaseSpacePackage}
    {F : GlobalFlowPDEPackage P}
    (I : InvariantManifoldPackage F) where
  attractorSet : Set P.spaceType
  compactness : Prop
  invariance : Prop
  attracting : Prop
  globalBasin : Prop

structure GlobalAttractorEvidence {P : PhaseSpacePackage}
    {F : GlobalFlowPDEPackage P}
    {I : InvariantManifoldPackage F}
    (A : GlobalAttractorPackage I) where
  compactnessClosed : A.compactness
  invarianceClosed : A.invariance
  attractingClosed : A.attracting
  globalBasinClosed : A.globalBasin

def GlobalAttractorClosed {P : PhaseSpacePackage}
    {F : GlobalFlowPDEPackage P}
    {I : InvariantManifoldPackage F}
    (A : GlobalAttractorPackage I) : Prop :=
  A.compactness ∧ A.invariance ∧ A.attracting ∧ A.globalBasin

theorem global_attractor_closed_from_evidence
    {P : PhaseSpacePackage} {F : GlobalFlowPDEPackage P}
    {I : InvariantManifoldPackage F}
    (A : GlobalAttractorPackage I)
    (E : GlobalAttractorEvidence A) : GlobalAttractorClosed A := by
  exact And.intro E.compactnessClosed
    (And.intro E.invarianceClosed
      (And.intro E.attractingClosed E.globalBasinClosed))

end DynamicalSystemsOverGlobalGroundTheoremCanonicalLaneLean
end HautevilleHouse