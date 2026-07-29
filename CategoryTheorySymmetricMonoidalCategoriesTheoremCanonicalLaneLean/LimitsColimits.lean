import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheorySymmetricMonoidalCategoriesTheoremCanonicalLaneLean

structure LimitsColimitsPackage where
  diagramCategory : Type u → Type u → Type u
  limit : Type u → Type u
  colimit : Type u → Type u
  universalProperties : Prop
  limitExistence : Prop
  colimitExistence : Prop

structure LimitsColimitsEvidence (L : LimitsColimitsPackage) where
  limitExistenceClosed : L.limitExistence
  colimitExistenceClosed : L.colimitExistence
  universalPropertiesClosed : L.universalProperties

def LimitsColimitsClosed (L : LimitsColimitsPackage) : Prop :=
  L.limitExistence ∧ L.colimitExistence ∧ L.universalProperties

theorem limits_colimits_closed_from_evidence (L : LimitsColimitsPackage)
    (E : LimitsColimitsEvidence L) : LimitsColimitsClosed L := by
  exact And.intro E.limitExistenceClosed (And.intro E.colimitExistenceClosed E.universalPropertiesClosed)

end CategoryTheorySymmetricMonoidalCategoriesTheoremCanonicalLaneLean
end HautevilleHouse
