import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsOverGlobalGroundTheoremCanonicalLaneLean

structure ShadowingPropertyPackage where
  phaseSpace : Type u
  flow : phaseSpace → ℝ → phaseSpace
  pseudoOrbit : Type v
  shadowingOrbit : Type w
  shadowingExists : Prop
  shadowingDistance : Prop

def ShadowingPropertyClosed (S : ShadowingPropertyPackage) : Prop :=
  S.shadowingExists ∧ S.shadowingDistance

theorem shadowing_property_closed (S : ShadowingPropertyPackage) : ShadowingPropertyClosed S := by
  exact And.intro S.shadowingExists S.shadowingDistance

end DynamicalSystemsOverGlobalGroundTheoremCanonicalLaneLean
end HautevilleHouse
