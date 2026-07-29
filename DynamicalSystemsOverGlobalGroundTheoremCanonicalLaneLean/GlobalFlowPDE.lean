import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsOverGlobalGroundTheoremCanonicalLaneLean

structure GlobalFlowPDEPackage (P : PhaseSpacePackage) where
  timeDomain : Type u
  vectorField : P.spaceType → P.spaceType
  globalExistence : Prop
  uniqueness : Prop
  smoothDependence : Prop

structure GlobalFlowPDEEvidence {P : PhaseSpacePackage}
    (F : GlobalFlowPDEPackage P) where
  globalExistenceClosed : F.globalExistence
  uniquenessClosed : F.uniqueness
  smoothDependenceClosed : F.smoothDependence

def GlobalFlowPDEClosed {P : PhaseSpacePackage}
    (F : GlobalFlowPDEPackage P) : Prop :=
  F.globalExistence ∧ F.uniqueness ∧ F.smoothDependence

theorem global_flow_pde_closed_from_evidence
    {P : PhaseSpacePackage} (F : GlobalFlowPDEPackage P)
    (E : GlobalFlowPDEEvidence F) : GlobalFlowPDEClosed F := by
  exact And.intro E.globalExistenceClosed
    (And.intro E.uniquenessClosed E.smoothDependenceClosed)

end DynamicalSystemsOverGlobalGroundTheoremCanonicalLaneLean
end HautevilleHouse