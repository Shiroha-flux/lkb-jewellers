// Ring filter options for the engagement rings listing page
// Matches Cullen Jewellery filter categories

export type ShapeValue = 'round' | 'oval' | 'emerald' | 'radiant' | 'pear' | 'cushion' | 'elongated_cushion' | 'elongated_hexagon' | 'marquise' | 'princess' | 'asscher' | 'heart'
export type MetalValue = 'two_tone' | 'platinum' | 'yellow_gold' | 'rose_gold' | 'white_gold'
export type SettingStyleValue = 'trilogy' | 'solitaire' | 'halo' | 'toi_et_moi' | 'bezel' | 'east_west'
export type BandTypeValue = 'plain' | 'pave' | 'accents'
export type SettingProfileValue = 'high_set' | 'low_set'

export interface FilterOption<T extends string = string> {
  value: T
  label: string
  description?: string
}

export interface ShapeOption extends FilterOption<ShapeValue> {
  svgPath: string
}

export interface MetalOption extends FilterOption<MetalValue> {
  color: string
  secondaryColor?: string
}

export const shapeOptions: ShapeOption[] = [
  {
    value: 'round',
    label: 'Round',
    description: 'Classic and timeless, the most popular diamond shape',
    svgPath: 'M12 2a10 10 0 1 0 0 20A10 10 0 0 0 12 2z',
  },
  {
    value: 'oval',
    label: 'Oval',
    description: 'Elongated shape that makes fingers appear longer',
    svgPath: 'M12 3C7.5 3 4 7 4 12s3.5 9 8 9 8-4 8-9-3.5-9-8-9z',
  },
  {
    value: 'emerald',
    label: 'Emerald',
    description: 'Rectangular step-cut with elegant hall-of-mirrors effect',
    svgPath: 'M5 7h14v10H5z M3 9l2-2 M3 15l2 2 M21 9l-2-2 M21 15l-2 2',
  },
  {
    value: 'radiant',
    label: 'Radiant',
    description: 'Rectangular with brilliant-cut facets for maximum sparkle',
    svgPath: 'M6 6h12v12H6z M4 8l2-2 M4 16l2 2 M20 8l-2-2 M20 16l-2 2',
  },
  {
    value: 'pear',
    label: 'Pear',
    description: 'Teardrop shape combining round and marquise cuts',
    svgPath: 'M12 3C9 3 6 6 6 10c0 4 2.5 7 6 9 3.5-2 6-5 6-9 0-4-3-7-6-7z',
  },
  {
    value: 'cushion',
    label: 'Cushion',
    description: 'Square with rounded corners, vintage-inspired brilliance',
    svgPath: 'M7 5h10a2 2 0 0 1 2 2v10a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V7a2 2 0 0 1 2-2z',
  },
  {
    value: 'elongated_cushion',
    label: 'Elongated Cushion',
    description: 'Rectangular cushion with soft rounded corners',
    svgPath: 'M6 6h12a2 2 0 0 1 2 2v8a2 2 0 0 1-2 2H6a2 2 0 0 1-2-2V8a2 2 0 0 1 2-2z',
  },
  {
    value: 'elongated_hexagon',
    label: 'Elongated Hexagon',
    description: 'Unique hexagonal shape with modern geometric appeal',
    svgPath: 'M8 4l8 0 4 7-4 7-8 0-4-7z',
  },
  {
    value: 'marquise',
    label: 'Marquise',
    description: 'Boat-shaped cut that maximizes carat weight appearance',
    svgPath: 'M12 3L20 12 12 21 4 12z',
  },
  {
    value: 'princess',
    label: 'Princess',
    description: 'Square brilliant cut with exceptional fire and sparkle',
    svgPath: 'M6 6h12v12H6z',
  },
  {
    value: 'asscher',
    label: 'Asscher',
    description: 'Square step-cut with distinctive windmill pattern',
    svgPath: 'M7 7h10v10H7z M5 9l2-2 M5 15l2 2 M19 9l-2-2 M19 15l-2 2',
  },
  {
    value: 'heart',
    label: 'Heart',
    description: 'Romantic symbol of love and devotion',
    svgPath: 'M12 21C12 21 4 14 4 9a4 4 0 0 1 8 0 4 4 0 0 1 8 0c0 5-8 12-8 12z',
  },
]

export const metalOptions: MetalOption[] = [
  {
    value: 'two_tone',
    label: 'Two Tone',
    description: 'Combination of two metals for a unique look',
    color: '#C0C0C0',
    secondaryColor: '#D4AF37',
  },
  {
    value: 'platinum',
    label: 'Platinum',
    description: 'Rare, durable, and naturally white metal',
    color: '#E8E8E8',
  },
  {
    value: 'yellow_gold',
    label: 'Yellow Gold',
    description: 'Classic warm gold in 18k purity',
    color: '#D4AF37',
  },
  {
    value: 'rose_gold',
    label: 'Rose Gold',
    description: 'Romantic blush-toned 18k gold',
    color: '#B76E79',
  },
  {
    value: 'white_gold',
    label: 'White Gold',
    description: 'Bright white 18k gold with rhodium plating',
    color: '#D0D0D0',
  },
]

export const settingStyleOptions: FilterOption<SettingStyleValue>[] = [
  {
    value: 'trilogy',
    label: 'Trilogy',
    description: 'Three stones representing past, present, and future',
  },
  {
    value: 'solitaire',
    label: 'Solitaire',
    description: 'Single centre stone for timeless elegance',
  },
  {
    value: 'halo',
    label: 'Halo',
    description: 'Centre stone surrounded by a halo of smaller diamonds',
  },
  {
    value: 'toi_et_moi',
    label: 'Toi et Moi',
    description: 'Two stones representing two souls united',
  },
  {
    value: 'bezel',
    label: 'Bezel',
    description: 'Stone encircled by a metal rim for modern protection',
  },
  {
    value: 'east_west',
    label: 'East West',
    description: 'Stone set horizontally for a contemporary look',
  },
]

export const bandTypeOptions: FilterOption<BandTypeValue>[] = [
  {
    value: 'plain',
    label: 'Plain',
    description: 'Clean, smooth band for understated elegance',
  },
  {
    value: 'pave',
    label: 'Pavé',
    description: 'Band set with small diamonds for extra sparkle',
  },
  {
    value: 'accents',
    label: 'Accents',
    description: 'Band with accent stones for added detail',
  },
]

export const settingProfileOptions: FilterOption<SettingProfileValue>[] = [
  {
    value: 'high_set',
    label: 'High Set',
    description: 'Stone elevated above the band for maximum light exposure',
  },
  {
    value: 'low_set',
    label: 'Low Set',
    description: 'Stone sits closer to the band for a sleek profile',
  },
]

export interface AllFilterOptions {
  shapes: ShapeOption[]
  metals: MetalOption[]
  settingStyles: FilterOption<SettingStyleValue>[]
  bandTypes: FilterOption<BandTypeValue>[]
  settingProfiles: FilterOption<SettingProfileValue>[]
}

export const allFilterOptions: AllFilterOptions = {
  shapes: shapeOptions,
  metals: metalOptions,
  settingStyles: settingStyleOptions,
  bandTypes: bandTypeOptions,
  settingProfiles: settingProfileOptions,
}
