import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsOverGlobalGroundTheoremCanonicalLaneLean

structure AdmissibleClass where
  object : DynamicalAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  DynamicalWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end DynamicalSystemsOverGlobalGroundTheoremCanonicalLaneLean
end HautevilleHouse