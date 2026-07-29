import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsOverGlobalGroundTheoremCanonicalLaneLean

structure ErgodicityPackage {P : PhaseSpacePackage} where
  invariantSigmaAlgebra : Type u
  ergodicMeasure : Prop
  mixingProperty : Prop
  decayOfCorrelations : Prop

structure ErgodicityEvidence {P : PhaseSpacePackage} (E : ErgodicityPackage P) where
  ergodicMeasureClosed : E.ergodicMeasure
  mixingPropertyClosed : E.mixingProperty
  decayOfCorrelationsClosed : E.decayOfCorrelations

def ErgodicityClosed {P : PhaseSpacePackage} (E : ErgodicityPackage P) : Prop :=
  E.ergodicMeasure ∧ E.mixingProperty ∧ E.decayOfCorrelations

theorem ergodicity_closed_from_evidence {P : PhaseSpacePackage} (E : ErgodicityPackage P) (Ev : ErgodicityEvidence E) :
    ErgodicityClosed E := by
  exact And.intro Ev.ergodicMeasureClosed (And.intro Ev.mixingPropertyClosed Ev.decayOfCorrelationsClosed)

end DynamicalSystemsOverGlobalGroundTheoremCanonicalLaneLean
end HautevilleHouse