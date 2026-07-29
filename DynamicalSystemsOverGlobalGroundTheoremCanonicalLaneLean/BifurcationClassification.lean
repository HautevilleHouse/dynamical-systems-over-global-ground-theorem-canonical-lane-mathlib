import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsOverGlobalGroundTheoremCanonicalLaneLean

structure BifurcationClassificationPackage {P : PhaseSpacePackage} where
  parameterSpace : Type u
  bifurcationPoints : Set (P.stateManifold × parameterSpace)
  bifurcationTypesClassified : Prop
  genericUnfolding : Prop

structure BifurcationClassificationEvidence {P : PhaseSpacePackage} (B : BifurcationClassificationPackage P) where
  bifurcationTypesClassifiedClosed : B.bifurcationTypesClassified
  genericUnfoldingClosed : B.genericUnfolding

def BifurcationClassificationClosed {P : PhaseSpacePackage} (B : BifurcationClassificationPackage P) : Prop :=
  B.bifurcationTypesClassified ∧ B.genericUnfolding

theorem bifurcation_classification_closed_from_evidence {P : PhaseSpacePackage} (B : BifurcationClassificationPackage P) (E : BifurcationClassificationEvidence B) :
    BifurcationClassificationClosed B := by
  exact And.intro E.bifurcationTypesClassifiedClosed E.genericUnfoldingClosed

end DynamicalSystemsOverGlobalGroundTheoremCanonicalLaneLean
end HautevilleHouse