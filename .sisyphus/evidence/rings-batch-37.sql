DO $$
DECLARE v_id UUID;
BEGIN
  INSERT INTO engagement_rings (slug, name, title, description, base_price_usd, currency, shape, setting_style, band_type, setting_profile)
  VALUES (
    'ring-river',
    'River',
    'River - Marquise 4 Claw Solitaire with East West Setting and Raised Basket Gallery Engagement Ring',
    'The River engagement ring is an elegant east-west design featuring a marquise cut centre stone placed horizontally on a polished band. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'marquise'::enum_ring_shape,
    'east_west'::enum_ring_setting_style,
    'plain'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-river';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-river-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/river/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/river/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-river-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/river/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/river/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-river-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/river/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/river/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-river-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-river-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-river-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-river-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-river-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-river-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-river-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-river-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-river-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-river-size-0', 1, v_id, 'D'),
      ('ring-river-size-1', 2, v_id, 'E'),
      ('ring-river-size-2', 3, v_id, 'F'),
      ('ring-river-size-3', 4, v_id, 'G'),
      ('ring-river-size-4', 5, v_id, 'H'),
      ('ring-river-size-5', 6, v_id, 'I'),
      ('ring-river-size-6', 7, v_id, 'J'),
      ('ring-river-size-7', 8, v_id, 'K'),
      ('ring-river-size-8', 9, v_id, 'L'),
      ('ring-river-size-9', 10, v_id, 'M'),
      ('ring-river-size-10', 11, v_id, 'N'),
      ('ring-river-size-11', 12, v_id, 'O'),
      ('ring-river-size-12', 13, v_id, 'P'),
      ('ring-river-size-13', 14, v_id, 'Q'),
      ('ring-river-size-14', 15, v_id, 'R'),
      ('ring-river-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-river-specs',
      v_id,
      '1.5mm',
      '16',
      '6.5 x 4.5mm',
      NULL,
      '2.8g',
      true
    )
    ON CONFLICT (ring_id) DO NOTHING;
  END IF;
END $$;

DO $$
DECLARE v_id UUID;
BEGIN
  INSERT INTO engagement_rings (slug, name, title, description, base_price_usd, currency, shape, setting_style, band_type, setting_profile)
  VALUES (
    'ring-rosalia',
    'Rosalia',
    'Rosalia - Pear Claw Trilogy with Pear Side Stones and Floating Cathedral High Setting Engagement Ring',
    'Rosalia is an exquisite 5-claw pear trilogy showcasing a beautiful pear cut centre stone and two pear cut side stones atop a sweeping cathedral setting. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'pear'::enum_ring_shape,
    'trilogy'::enum_ring_setting_style,
    'plain'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-rosalia';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-rosalia-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/rosalia/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/rosalia/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-rosalia-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/rosalia/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/rosalia/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-rosalia-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/rosalia/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/rosalia/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-rosalia-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-rosalia-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-rosalia-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-rosalia-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-rosalia-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-rosalia-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-rosalia-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-rosalia-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-rosalia-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-rosalia-size-0', 1, v_id, 'D'),
      ('ring-rosalia-size-1', 2, v_id, 'E'),
      ('ring-rosalia-size-2', 3, v_id, 'F'),
      ('ring-rosalia-size-3', 4, v_id, 'G'),
      ('ring-rosalia-size-4', 5, v_id, 'H'),
      ('ring-rosalia-size-5', 6, v_id, 'I'),
      ('ring-rosalia-size-6', 7, v_id, 'J'),
      ('ring-rosalia-size-7', 8, v_id, 'K'),
      ('ring-rosalia-size-8', 9, v_id, 'L'),
      ('ring-rosalia-size-9', 10, v_id, 'M'),
      ('ring-rosalia-size-10', 11, v_id, 'N'),
      ('ring-rosalia-size-11', 12, v_id, 'O'),
      ('ring-rosalia-size-12', 13, v_id, 'P'),
      ('ring-rosalia-size-13', 14, v_id, 'Q'),
      ('ring-rosalia-size-14', 15, v_id, 'R'),
      ('ring-rosalia-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-rosalia-specs',
      v_id,
      '1.5mm',
      '16',
      '6.5 x 4.5mm',
      NULL,
      '2.8g',
      true
    )
    ON CONFLICT (ring_id) DO NOTHING;
  END IF;
END $$;

DO $$
DECLARE v_id UUID;
BEGIN
  INSERT INTO engagement_rings (slug, name, title, description, base_price_usd, currency, shape, setting_style, band_type, setting_profile)
  VALUES (
    'ring-rose',
    'Rose',
    'Rose - Fluted Cigar Ring',
    'The Rose wedding ring is a modern take on a croissant ring with a pillowy cigar band and stunning fluted design. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'round'::enum_ring_shape,
    'solitaire'::enum_ring_setting_style,
    'plain'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-rose';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-rose-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/rose/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/rose/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-rose-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/rose/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/rose/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-rose-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/rose/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/rose/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-rose-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-rose-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-rose-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-rose-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-rose-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-rose-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-rose-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-rose-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-rose-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-rose-size-0', 1, v_id, 'D'),
      ('ring-rose-size-1', 2, v_id, 'E'),
      ('ring-rose-size-2', 3, v_id, 'F'),
      ('ring-rose-size-3', 4, v_id, 'G'),
      ('ring-rose-size-4', 5, v_id, 'H'),
      ('ring-rose-size-5', 6, v_id, 'I'),
      ('ring-rose-size-6', 7, v_id, 'J'),
      ('ring-rose-size-7', 8, v_id, 'K'),
      ('ring-rose-size-8', 9, v_id, 'L'),
      ('ring-rose-size-9', 10, v_id, 'M'),
      ('ring-rose-size-10', 11, v_id, 'N'),
      ('ring-rose-size-11', 12, v_id, 'O'),
      ('ring-rose-size-12', 13, v_id, 'P'),
      ('ring-rose-size-13', 14, v_id, 'Q'),
      ('ring-rose-size-14', 15, v_id, 'R'),
      ('ring-rose-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-rose-specs',
      v_id,
      '1.5mm',
      '16',
      '6.5 x 4.5mm',
      NULL,
      '2.8g',
      true
    )
    ON CONFLICT (ring_id) DO NOTHING;
  END IF;
END $$;

DO $$
DECLARE v_id UUID;
BEGIN
  INSERT INTO engagement_rings (slug, name, title, description, base_price_usd, currency, shape, setting_style, band_type, setting_profile)
  VALUES (
    'ring-rosie',
    'Rosie',
    'Rosie - Cushion 4 Claw Solitaire with Hidden Halo Engagement Ring',
    'Rosie is a timeless cushion solitaire design complete with four eagle-tipped claws and a sparkling hidden halo. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'cushion'::enum_ring_shape,
    'halo'::enum_ring_setting_style,
    'plain'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-rosie';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-rosie-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/rosie/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/rosie/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-rosie-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/rosie/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/rosie/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-rosie-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/rosie/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/rosie/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-rosie-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-rosie-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-rosie-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-rosie-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-rosie-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-rosie-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-rosie-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-rosie-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-rosie-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-rosie-size-0', 1, v_id, 'D'),
      ('ring-rosie-size-1', 2, v_id, 'E'),
      ('ring-rosie-size-2', 3, v_id, 'F'),
      ('ring-rosie-size-3', 4, v_id, 'G'),
      ('ring-rosie-size-4', 5, v_id, 'H'),
      ('ring-rosie-size-5', 6, v_id, 'I'),
      ('ring-rosie-size-6', 7, v_id, 'J'),
      ('ring-rosie-size-7', 8, v_id, 'K'),
      ('ring-rosie-size-8', 9, v_id, 'L'),
      ('ring-rosie-size-9', 10, v_id, 'M'),
      ('ring-rosie-size-10', 11, v_id, 'N'),
      ('ring-rosie-size-11', 12, v_id, 'O'),
      ('ring-rosie-size-12', 13, v_id, 'P'),
      ('ring-rosie-size-13', 14, v_id, 'Q'),
      ('ring-rosie-size-14', 15, v_id, 'R'),
      ('ring-rosie-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-rosie-specs',
      v_id,
      '1.5mm',
      '16',
      '6.5 x 4.5mm',
      NULL,
      '2.8g',
      true
    )
    ON CONFLICT (ring_id) DO NOTHING;
  END IF;
END $$;

DO $$
DECLARE v_id UUID;
BEGIN
  INSERT INTO engagement_rings (slug, name, title, description, base_price_usd, currency, shape, setting_style, band_type, setting_profile)
  VALUES (
    'ring-rowena',
    'Rowena',
    'Rowena - Emerald 4 Claw Solitaire with Hidden Halo, Pave Band and Cathedral Setting Engagement Ring',
    'Rowena is a stunning 4-claw emerald solitaire featuring a sparkling hidden halo, sweeping cathedral arches and a 2/3 pavé band, creating an effortless combination of modern elegance. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'emerald'::enum_ring_shape,
    'halo'::enum_ring_setting_style,
    'pave'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-rowena';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-rowena-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/rowena/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/rowena/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-rowena-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/rowena/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/rowena/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-rowena-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/rowena/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/rowena/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-rowena-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-rowena-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-rowena-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-rowena-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-rowena-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-rowena-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-rowena-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-rowena-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-rowena-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-rowena-size-0', 1, v_id, 'D'),
      ('ring-rowena-size-1', 2, v_id, 'E'),
      ('ring-rowena-size-2', 3, v_id, 'F'),
      ('ring-rowena-size-3', 4, v_id, 'G'),
      ('ring-rowena-size-4', 5, v_id, 'H'),
      ('ring-rowena-size-5', 6, v_id, 'I'),
      ('ring-rowena-size-6', 7, v_id, 'J'),
      ('ring-rowena-size-7', 8, v_id, 'K'),
      ('ring-rowena-size-8', 9, v_id, 'L'),
      ('ring-rowena-size-9', 10, v_id, 'M'),
      ('ring-rowena-size-10', 11, v_id, 'N'),
      ('ring-rowena-size-11', 12, v_id, 'O'),
      ('ring-rowena-size-12', 13, v_id, 'P'),
      ('ring-rowena-size-13', 14, v_id, 'Q'),
      ('ring-rowena-size-14', 15, v_id, 'R'),
      ('ring-rowena-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-rowena-specs',
      v_id,
      '1.5mm',
      '16',
      '6.5 x 4.5mm',
      NULL,
      '2.8g',
      true
    )
    ON CONFLICT (ring_id) DO NOTHING;
  END IF;
END $$;