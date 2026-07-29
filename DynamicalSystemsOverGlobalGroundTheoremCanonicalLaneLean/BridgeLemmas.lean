import canonicalLaneMathlib.AdmissibleClass
import DynamicalSystemsOverGlobalGroundTheoremCanonicalLaneLean.GlobalGroundDynamics

namespace HautevilleHouse
namespace DynamicalSystemsOverGlobalGroundTheoremCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  GlobalWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end DynamicalSystemsOverGlobalGroundTheoremCanonicalLaneLean
end HautevilleHouse
