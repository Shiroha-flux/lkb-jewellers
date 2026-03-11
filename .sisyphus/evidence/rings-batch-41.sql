DO $$
DECLARE v_id UUID;
BEGIN
  INSERT INTO engagement_rings (slug, name, title, description, base_price_usd, currency, shape, setting_style, band_type, setting_profile)
  VALUES (
    'ring-siobhan',
    'Siobhan',
    'Siobhan - Round Claw Solitaire with Hidden Halo, Pave Collar and Pave Band Engagement Ring',
    'Siobhan is a beautiful 6-claw round solitaire with a sparkling hidden halo and collar placed atop a 2/3 pavé band. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'round'::enum_ring_shape,
    'halo'::enum_ring_setting_style,
    'pave'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-siobhan';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-siobhan-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/siobhan/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/siobhan/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-siobhan-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/siobhan/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/siobhan/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-siobhan-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/siobhan/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/siobhan/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-siobhan-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-siobhan-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-siobhan-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-siobhan-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-siobhan-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-siobhan-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-siobhan-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-siobhan-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-siobhan-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-siobhan-size-0', 1, v_id, 'D'),
      ('ring-siobhan-size-1', 2, v_id, 'E'),
      ('ring-siobhan-size-2', 3, v_id, 'F'),
      ('ring-siobhan-size-3', 4, v_id, 'G'),
      ('ring-siobhan-size-4', 5, v_id, 'H'),
      ('ring-siobhan-size-5', 6, v_id, 'I'),
      ('ring-siobhan-size-6', 7, v_id, 'J'),
      ('ring-siobhan-size-7', 8, v_id, 'K'),
      ('ring-siobhan-size-8', 9, v_id, 'L'),
      ('ring-siobhan-size-9', 10, v_id, 'M'),
      ('ring-siobhan-size-10', 11, v_id, 'N'),
      ('ring-siobhan-size-11', 12, v_id, 'O'),
      ('ring-siobhan-size-12', 13, v_id, 'P'),
      ('ring-siobhan-size-13', 14, v_id, 'Q'),
      ('ring-siobhan-size-14', 15, v_id, 'R'),
      ('ring-siobhan-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-siobhan-specs',
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
    'ring-sophia',
    'Sophia',
    'Sophia - Princess 4 Claw Solitaire with Angled Setting and Clustered Round Shoulder Stones Engagement Ring',
    'The Sophia engagement ring is a beautiful princess solitaire design characterised by a distinct pattern of dainty round cut accent stones set low on a polished band. Schedule an appointment with Cullen US today.',
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
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-sophia';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-sophia-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/sophia/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/sophia/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-sophia-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/sophia/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/sophia/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-sophia-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/sophia/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/sophia/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-sophia-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-sophia-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-sophia-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-sophia-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-sophia-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-sophia-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-sophia-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-sophia-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-sophia-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-sophia-size-0', 1, v_id, 'D'),
      ('ring-sophia-size-1', 2, v_id, 'E'),
      ('ring-sophia-size-2', 3, v_id, 'F'),
      ('ring-sophia-size-3', 4, v_id, 'G'),
      ('ring-sophia-size-4', 5, v_id, 'H'),
      ('ring-sophia-size-5', 6, v_id, 'I'),
      ('ring-sophia-size-6', 7, v_id, 'J'),
      ('ring-sophia-size-7', 8, v_id, 'K'),
      ('ring-sophia-size-8', 9, v_id, 'L'),
      ('ring-sophia-size-9', 10, v_id, 'M'),
      ('ring-sophia-size-10', 11, v_id, 'N'),
      ('ring-sophia-size-11', 12, v_id, 'O'),
      ('ring-sophia-size-12', 13, v_id, 'P'),
      ('ring-sophia-size-13', 14, v_id, 'Q'),
      ('ring-sophia-size-14', 15, v_id, 'R'),
      ('ring-sophia-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-sophia-specs',
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
    'ring-soraya',
    'Soraya',
    'Soraya - Oval Offset East West Claw Solitaire with Flat Cigar Band  Engagement Ring',
    'Soraya is a statement engagement ring with a breathtaking east-west oval solitaire held by four round claws on a bold cigar band. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'oval'::enum_ring_shape,
    'east_west'::enum_ring_setting_style,
    'plain'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-soraya';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-soraya-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/soraya/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/soraya/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-soraya-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/soraya/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/soraya/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-soraya-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/soraya/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/soraya/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-soraya-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-soraya-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-soraya-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-soraya-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-soraya-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-soraya-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-soraya-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-soraya-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-soraya-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-soraya-size-0', 1, v_id, 'D'),
      ('ring-soraya-size-1', 2, v_id, 'E'),
      ('ring-soraya-size-2', 3, v_id, 'F'),
      ('ring-soraya-size-3', 4, v_id, 'G'),
      ('ring-soraya-size-4', 5, v_id, 'H'),
      ('ring-soraya-size-5', 6, v_id, 'I'),
      ('ring-soraya-size-6', 7, v_id, 'J'),
      ('ring-soraya-size-7', 8, v_id, 'K'),
      ('ring-soraya-size-8', 9, v_id, 'L'),
      ('ring-soraya-size-9', 10, v_id, 'M'),
      ('ring-soraya-size-10', 11, v_id, 'N'),
      ('ring-soraya-size-11', 12, v_id, 'O'),
      ('ring-soraya-size-12', 13, v_id, 'P'),
      ('ring-soraya-size-13', 14, v_id, 'Q'),
      ('ring-soraya-size-14', 15, v_id, 'R'),
      ('ring-soraya-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-soraya-specs',
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
    'ring-stephanie',
    'Stephanie',
    'Stephanie - Marquise 4 Claw Solitaire Engagement Ring',
    'The Stephanie engagement ring is a classic 6-claw solitaire design, featuring a striking marquise cut centre stone set low on a sleek band. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'marquise'::enum_ring_shape,
    'solitaire'::enum_ring_setting_style,
    'plain'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-stephanie';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-stephanie-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/stephanie/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/stephanie/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-stephanie-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/stephanie/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/stephanie/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-stephanie-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/stephanie/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/stephanie/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-stephanie-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-stephanie-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-stephanie-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-stephanie-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-stephanie-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-stephanie-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-stephanie-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-stephanie-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-stephanie-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-stephanie-size-0', 1, v_id, 'D'),
      ('ring-stephanie-size-1', 2, v_id, 'E'),
      ('ring-stephanie-size-2', 3, v_id, 'F'),
      ('ring-stephanie-size-3', 4, v_id, 'G'),
      ('ring-stephanie-size-4', 5, v_id, 'H'),
      ('ring-stephanie-size-5', 6, v_id, 'I'),
      ('ring-stephanie-size-6', 7, v_id, 'J'),
      ('ring-stephanie-size-7', 8, v_id, 'K'),
      ('ring-stephanie-size-8', 9, v_id, 'L'),
      ('ring-stephanie-size-9', 10, v_id, 'M'),
      ('ring-stephanie-size-10', 11, v_id, 'N'),
      ('ring-stephanie-size-11', 12, v_id, 'O'),
      ('ring-stephanie-size-12', 13, v_id, 'P'),
      ('ring-stephanie-size-13', 14, v_id, 'Q'),
      ('ring-stephanie-size-14', 15, v_id, 'R'),
      ('ring-stephanie-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-stephanie-specs',
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
    'ring-suki',
    'Suki',
    'Suki - Pear East West Claw Solitaire with Raised Basket Gallery Engagement Ring',
    'Suki features an east-west set pear-cut centre stone, positioned low within a scooped basket. The design sits flush with a classic band for a clean, seamless profile. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'pear'::enum_ring_shape,
    'east_west'::enum_ring_setting_style,
    'plain'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-suki';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-suki-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/suki/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/suki/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-suki-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/suki/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/suki/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-suki-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/suki/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/suki/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-suki-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-suki-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-suki-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-suki-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-suki-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-suki-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-suki-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-suki-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-suki-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-suki-size-0', 1, v_id, 'D'),
      ('ring-suki-size-1', 2, v_id, 'E'),
      ('ring-suki-size-2', 3, v_id, 'F'),
      ('ring-suki-size-3', 4, v_id, 'G'),
      ('ring-suki-size-4', 5, v_id, 'H'),
      ('ring-suki-size-5', 6, v_id, 'I'),
      ('ring-suki-size-6', 7, v_id, 'J'),
      ('ring-suki-size-7', 8, v_id, 'K'),
      ('ring-suki-size-8', 9, v_id, 'L'),
      ('ring-suki-size-9', 10, v_id, 'M'),
      ('ring-suki-size-10', 11, v_id, 'N'),
      ('ring-suki-size-11', 12, v_id, 'O'),
      ('ring-suki-size-12', 13, v_id, 'P'),
      ('ring-suki-size-13', 14, v_id, 'Q'),
      ('ring-suki-size-14', 15, v_id, 'R'),
      ('ring-suki-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-suki-specs',
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