DO $$
DECLARE v_id UUID;
BEGIN
  INSERT INTO engagement_rings (slug, name, title, description, base_price_usd, currency, shape, setting_style, band_type, setting_profile)
  VALUES (
    'ring-aria',
    'Aria',
    'Aria - Round 6 Claw Solitaire with Wrap Around Hidden Halo Engagement Ring',
    'The Aria engagement ring features an exquisite round cut centre stone enclosed in six eagle-tipped claws and completed with a wrap-around hidden halo. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'round'::enum_ring_shape,
    'halo'::enum_ring_setting_style,
    'plain'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-aria';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-aria-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/aria/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/aria/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-aria-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/aria/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/aria/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-aria-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/aria/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/aria/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-aria-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-aria-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-aria-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-aria-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-aria-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-aria-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-aria-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-aria-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-aria-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-aria-size-0', 1, v_id, 'D'),
      ('ring-aria-size-1', 2, v_id, 'E'),
      ('ring-aria-size-2', 3, v_id, 'F'),
      ('ring-aria-size-3', 4, v_id, 'G'),
      ('ring-aria-size-4', 5, v_id, 'H'),
      ('ring-aria-size-5', 6, v_id, 'I'),
      ('ring-aria-size-6', 7, v_id, 'J'),
      ('ring-aria-size-7', 8, v_id, 'K'),
      ('ring-aria-size-8', 9, v_id, 'L'),
      ('ring-aria-size-9', 10, v_id, 'M'),
      ('ring-aria-size-10', 11, v_id, 'N'),
      ('ring-aria-size-11', 12, v_id, 'O'),
      ('ring-aria-size-12', 13, v_id, 'P'),
      ('ring-aria-size-13', 14, v_id, 'Q'),
      ('ring-aria-size-14', 15, v_id, 'R'),
      ('ring-aria-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-aria-specs',
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
    'ring-arielle',
    'Arielle',
    'Arielle - Oval 4 Claw Solitaire with Sunburst Halo and Cathedral Setting Engagement Ring',
    'Utterly unique in its design, Arielle is a beautiful oval halo engagement ring featuring round claws and a sweeping cathedral setting. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'oval'::enum_ring_shape,
    'halo'::enum_ring_setting_style,
    'plain'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-arielle';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-arielle-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/arielle/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/arielle/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-arielle-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/arielle/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/arielle/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-arielle-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/arielle/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/arielle/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-arielle-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-arielle-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-arielle-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-arielle-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-arielle-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-arielle-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-arielle-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-arielle-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-arielle-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-arielle-size-0', 1, v_id, 'D'),
      ('ring-arielle-size-1', 2, v_id, 'E'),
      ('ring-arielle-size-2', 3, v_id, 'F'),
      ('ring-arielle-size-3', 4, v_id, 'G'),
      ('ring-arielle-size-4', 5, v_id, 'H'),
      ('ring-arielle-size-5', 6, v_id, 'I'),
      ('ring-arielle-size-6', 7, v_id, 'J'),
      ('ring-arielle-size-7', 8, v_id, 'K'),
      ('ring-arielle-size-8', 9, v_id, 'L'),
      ('ring-arielle-size-9', 10, v_id, 'M'),
      ('ring-arielle-size-10', 11, v_id, 'N'),
      ('ring-arielle-size-11', 12, v_id, 'O'),
      ('ring-arielle-size-12', 13, v_id, 'P'),
      ('ring-arielle-size-13', 14, v_id, 'Q'),
      ('ring-arielle-size-14', 15, v_id, 'R'),
      ('ring-arielle-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-arielle-specs',
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
    'ring-arlo',
    'Arlo',
    'Arlo - Oval 4 Claw Solitaire with Bezel Frame and East West Setting Engagement Ring',
    'Designed to be worn low set, the Arlo is an east west oval cut solitaire that blends vintage character with sculptural modern design for an effortlessly elevated silhouette that features a subtle under bezel frame and our signature eagle claws, offering the perfect balance for those torn between a bezel and a claw setting. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'oval'::enum_ring_shape,
    'bezel'::enum_ring_setting_style,
    'plain'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-arlo';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-arlo-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/arlo/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/arlo/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-arlo-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/arlo/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/arlo/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-arlo-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/arlo/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/arlo/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-arlo-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-arlo-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-arlo-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-arlo-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-arlo-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-arlo-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-arlo-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-arlo-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-arlo-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-arlo-size-0', 1, v_id, 'D'),
      ('ring-arlo-size-1', 2, v_id, 'E'),
      ('ring-arlo-size-2', 3, v_id, 'F'),
      ('ring-arlo-size-3', 4, v_id, 'G'),
      ('ring-arlo-size-4', 5, v_id, 'H'),
      ('ring-arlo-size-5', 6, v_id, 'I'),
      ('ring-arlo-size-6', 7, v_id, 'J'),
      ('ring-arlo-size-7', 8, v_id, 'K'),
      ('ring-arlo-size-8', 9, v_id, 'L'),
      ('ring-arlo-size-9', 10, v_id, 'M'),
      ('ring-arlo-size-10', 11, v_id, 'N'),
      ('ring-arlo-size-11', 12, v_id, 'O'),
      ('ring-arlo-size-12', 13, v_id, 'P'),
      ('ring-arlo-size-13', 14, v_id, 'Q'),
      ('ring-arlo-size-14', 15, v_id, 'R'),
      ('ring-arlo-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-arlo-specs',
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
    'ring-ashlea',
    'Ashlea',
    'Ashlea - Round 4 Claw Solitaire with Hidden Halo, Pave Band and Cathedral Setting Engagement Ring',
    'Ashlea is an elegant round solitaire design accentuated by a sweeping cathedral setting, dazzling hidden halo and 2/3 pavé band. Schedule an appointment with Cullen US today.',
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
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-ashlea';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-ashlea-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/ashlea/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/ashlea/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-ashlea-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/ashlea/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/ashlea/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-ashlea-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/ashlea/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/ashlea/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-ashlea-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-ashlea-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-ashlea-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-ashlea-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-ashlea-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-ashlea-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-ashlea-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-ashlea-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-ashlea-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-ashlea-size-0', 1, v_id, 'D'),
      ('ring-ashlea-size-1', 2, v_id, 'E'),
      ('ring-ashlea-size-2', 3, v_id, 'F'),
      ('ring-ashlea-size-3', 4, v_id, 'G'),
      ('ring-ashlea-size-4', 5, v_id, 'H'),
      ('ring-ashlea-size-5', 6, v_id, 'I'),
      ('ring-ashlea-size-6', 7, v_id, 'J'),
      ('ring-ashlea-size-7', 8, v_id, 'K'),
      ('ring-ashlea-size-8', 9, v_id, 'L'),
      ('ring-ashlea-size-9', 10, v_id, 'M'),
      ('ring-ashlea-size-10', 11, v_id, 'N'),
      ('ring-ashlea-size-11', 12, v_id, 'O'),
      ('ring-ashlea-size-12', 13, v_id, 'P'),
      ('ring-ashlea-size-13', 14, v_id, 'Q'),
      ('ring-ashlea-size-14', 15, v_id, 'R'),
      ('ring-ashlea-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-ashlea-specs',
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
    'ring-aspen',
    'Aspen',
    'Aspen - Pear 5 Claw Solitaire with Tapered Band and Cathedral Setting Engagement Ring',
    'The Aspen engagement ring highlights a striking pear cut centre stone with five eagle-tipped claws and slim tapered band. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'pear'::enum_ring_shape,
    'solitaire'::enum_ring_setting_style,
    'plain'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-aspen';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-aspen-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/aspen/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/aspen/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-aspen-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/aspen/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/aspen/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-aspen-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/aspen/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/aspen/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-aspen-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-aspen-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-aspen-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-aspen-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-aspen-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-aspen-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-aspen-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-aspen-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-aspen-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-aspen-size-0', 1, v_id, 'D'),
      ('ring-aspen-size-1', 2, v_id, 'E'),
      ('ring-aspen-size-2', 3, v_id, 'F'),
      ('ring-aspen-size-3', 4, v_id, 'G'),
      ('ring-aspen-size-4', 5, v_id, 'H'),
      ('ring-aspen-size-5', 6, v_id, 'I'),
      ('ring-aspen-size-6', 7, v_id, 'J'),
      ('ring-aspen-size-7', 8, v_id, 'K'),
      ('ring-aspen-size-8', 9, v_id, 'L'),
      ('ring-aspen-size-9', 10, v_id, 'M'),
      ('ring-aspen-size-10', 11, v_id, 'N'),
      ('ring-aspen-size-11', 12, v_id, 'O'),
      ('ring-aspen-size-12', 13, v_id, 'P'),
      ('ring-aspen-size-13', 14, v_id, 'Q'),
      ('ring-aspen-size-14', 15, v_id, 'R'),
      ('ring-aspen-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-aspen-specs',
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
    'ring-aster',
    'Aster',
    'Aster - Radiant Claw Solitaire with Petal Gallery and Accented Tiara Detail Engagement Ring',
    'Aster centres a radiant stone in a refined four-claw setting, framed by a sculpted petal gallery. A discreet tiara-style hidden halo sits beneath, adding quiet detail and soft, modern structure. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'radiant'::enum_ring_shape,
    'solitaire'::enum_ring_setting_style,
    'accents'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-aster';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-aster-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/aster/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/aster/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-aster-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/aster/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/aster/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-aster-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/aster/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/aster/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-aster-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-aster-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-aster-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-aster-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-aster-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-aster-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-aster-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-aster-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-aster-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-aster-size-0', 1, v_id, 'D'),
      ('ring-aster-size-1', 2, v_id, 'E'),
      ('ring-aster-size-2', 3, v_id, 'F'),
      ('ring-aster-size-3', 4, v_id, 'G'),
      ('ring-aster-size-4', 5, v_id, 'H'),
      ('ring-aster-size-5', 6, v_id, 'I'),
      ('ring-aster-size-6', 7, v_id, 'J'),
      ('ring-aster-size-7', 8, v_id, 'K'),
      ('ring-aster-size-8', 9, v_id, 'L'),
      ('ring-aster-size-9', 10, v_id, 'M'),
      ('ring-aster-size-10', 11, v_id, 'N'),
      ('ring-aster-size-11', 12, v_id, 'O'),
      ('ring-aster-size-12', 13, v_id, 'P'),
      ('ring-aster-size-13', 14, v_id, 'Q'),
      ('ring-aster-size-14', 15, v_id, 'R'),
      ('ring-aster-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-aster-specs',
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
    'ring-athena',
    'Athena',
    'Athena - Oval Claw Solitaire with Double Plain-and-Round-Accent Stones Band Engagement Ring',
    'Graceful yet bold, the Athena engagement ring features a beautiful oval cut centre stone, double band design and sparkling hidden halo. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'oval'::enum_ring_shape,
    'solitaire'::enum_ring_setting_style,
    'accents'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-athena';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-athena-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/athena/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/athena/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-athena-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/athena/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/athena/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-athena-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/athena/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/athena/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-athena-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-athena-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-athena-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-athena-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-athena-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-athena-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-athena-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-athena-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-athena-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-athena-size-0', 1, v_id, 'D'),
      ('ring-athena-size-1', 2, v_id, 'E'),
      ('ring-athena-size-2', 3, v_id, 'F'),
      ('ring-athena-size-3', 4, v_id, 'G'),
      ('ring-athena-size-4', 5, v_id, 'H'),
      ('ring-athena-size-5', 6, v_id, 'I'),
      ('ring-athena-size-6', 7, v_id, 'J'),
      ('ring-athena-size-7', 8, v_id, 'K'),
      ('ring-athena-size-8', 9, v_id, 'L'),
      ('ring-athena-size-9', 10, v_id, 'M'),
      ('ring-athena-size-10', 11, v_id, 'N'),
      ('ring-athena-size-11', 12, v_id, 'O'),
      ('ring-athena-size-12', 13, v_id, 'P'),
      ('ring-athena-size-13', 14, v_id, 'Q'),
      ('ring-athena-size-14', 15, v_id, 'R'),
      ('ring-athena-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-athena-specs',
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
    'ring-aubrey',
    'Aubrey',
    'Aubrey - Elongated Cushion 4 Double Claw Solitaire with Hidden Halo Engagement Ring',
    'The Aubrey engagement ring adds a unique touch to the classic elongated solitaire style with a double-tipped 4-claw setting and sparkling hidden halo. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'elongated_cushion'::enum_ring_shape,
    'halo'::enum_ring_setting_style,
    'plain'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-aubrey';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-aubrey-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/aubrey/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/aubrey/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-aubrey-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/aubrey/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/aubrey/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-aubrey-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/aubrey/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/aubrey/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-aubrey-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-aubrey-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-aubrey-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-aubrey-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-aubrey-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-aubrey-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-aubrey-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-aubrey-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-aubrey-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-aubrey-size-0', 1, v_id, 'D'),
      ('ring-aubrey-size-1', 2, v_id, 'E'),
      ('ring-aubrey-size-2', 3, v_id, 'F'),
      ('ring-aubrey-size-3', 4, v_id, 'G'),
      ('ring-aubrey-size-4', 5, v_id, 'H'),
      ('ring-aubrey-size-5', 6, v_id, 'I'),
      ('ring-aubrey-size-6', 7, v_id, 'J'),
      ('ring-aubrey-size-7', 8, v_id, 'K'),
      ('ring-aubrey-size-8', 9, v_id, 'L'),
      ('ring-aubrey-size-9', 10, v_id, 'M'),
      ('ring-aubrey-size-10', 11, v_id, 'N'),
      ('ring-aubrey-size-11', 12, v_id, 'O'),
      ('ring-aubrey-size-12', 13, v_id, 'P'),
      ('ring-aubrey-size-13', 14, v_id, 'Q'),
      ('ring-aubrey-size-14', 15, v_id, 'R'),
      ('ring-aubrey-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-aubrey-specs',
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
    'ring-aurelie',
    'Aurelie',
    'Aurelie - Oval Claw Solitaire with Petal Gallery and Accent Leaf Detail Engagement Ring',
    'Aurelie is a 4-claw oval that offers a twist on a classic solitaire with an accented petal gallery. Emphasising beauty in the smallest details, a secret hidden halo is encased within the petite petals, offering support for a subtle yet elegant form. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'oval'::enum_ring_shape,
    'solitaire'::enum_ring_setting_style,
    'accents'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-aurelie';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-aurelie-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/aurelie/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/aurelie/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-aurelie-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/aurelie/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/aurelie/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-aurelie-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/aurelie/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/aurelie/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-aurelie-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-aurelie-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-aurelie-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-aurelie-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-aurelie-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-aurelie-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-aurelie-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-aurelie-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-aurelie-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-aurelie-size-0', 1, v_id, 'D'),
      ('ring-aurelie-size-1', 2, v_id, 'E'),
      ('ring-aurelie-size-2', 3, v_id, 'F'),
      ('ring-aurelie-size-3', 4, v_id, 'G'),
      ('ring-aurelie-size-4', 5, v_id, 'H'),
      ('ring-aurelie-size-5', 6, v_id, 'I'),
      ('ring-aurelie-size-6', 7, v_id, 'J'),
      ('ring-aurelie-size-7', 8, v_id, 'K'),
      ('ring-aurelie-size-8', 9, v_id, 'L'),
      ('ring-aurelie-size-9', 10, v_id, 'M'),
      ('ring-aurelie-size-10', 11, v_id, 'N'),
      ('ring-aurelie-size-11', 12, v_id, 'O'),
      ('ring-aurelie-size-12', 13, v_id, 'P'),
      ('ring-aurelie-size-13', 14, v_id, 'Q'),
      ('ring-aurelie-size-14', 15, v_id, 'R'),
      ('ring-aurelie-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-aurelie-specs',
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
    'ring-ava',
    'Ava',
    'Ava - Elongated Cushion 4 Claw Solitaire with Hidden Halo Engagement Ring',
    'Ava is a popular cushion solitaire design complete with a sparkling hidden halo, 4-claw setting and slim band. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'elongated_cushion'::enum_ring_shape,
    'halo'::enum_ring_setting_style,
    'plain'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-ava';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-ava-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/ava/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/ava/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-ava-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/ava/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/ava/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-ava-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/ava/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/ava/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-ava-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-ava-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-ava-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-ava-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-ava-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-ava-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-ava-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-ava-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-ava-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-ava-size-0', 1, v_id, 'D'),
      ('ring-ava-size-1', 2, v_id, 'E'),
      ('ring-ava-size-2', 3, v_id, 'F'),
      ('ring-ava-size-3', 4, v_id, 'G'),
      ('ring-ava-size-4', 5, v_id, 'H'),
      ('ring-ava-size-5', 6, v_id, 'I'),
      ('ring-ava-size-6', 7, v_id, 'J'),
      ('ring-ava-size-7', 8, v_id, 'K'),
      ('ring-ava-size-8', 9, v_id, 'L'),
      ('ring-ava-size-9', 10, v_id, 'M'),
      ('ring-ava-size-10', 11, v_id, 'N'),
      ('ring-ava-size-11', 12, v_id, 'O'),
      ('ring-ava-size-12', 13, v_id, 'P'),
      ('ring-ava-size-13', 14, v_id, 'Q'),
      ('ring-ava-size-14', 15, v_id, 'R'),
      ('ring-ava-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-ava-specs',
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
    'ring-avery',
    'Avery',
    'Avery - Oval 4 Double Claw Solitaire with Hidden Halo Engagement Ring',
    'The Avery engagement ring adds a unique touch to the classic oval solitaire design with four double-tipped claws, a basket setting and a hidden halo. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'oval'::enum_ring_shape,
    'halo'::enum_ring_setting_style,
    'plain'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-avery';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-avery-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/avery/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/avery/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-avery-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/avery/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/avery/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-avery-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/avery/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/avery/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-avery-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-avery-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-avery-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-avery-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-avery-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-avery-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-avery-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-avery-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-avery-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-avery-size-0', 1, v_id, 'D'),
      ('ring-avery-size-1', 2, v_id, 'E'),
      ('ring-avery-size-2', 3, v_id, 'F'),
      ('ring-avery-size-3', 4, v_id, 'G'),
      ('ring-avery-size-4', 5, v_id, 'H'),
      ('ring-avery-size-5', 6, v_id, 'I'),
      ('ring-avery-size-6', 7, v_id, 'J'),
      ('ring-avery-size-7', 8, v_id, 'K'),
      ('ring-avery-size-8', 9, v_id, 'L'),
      ('ring-avery-size-9', 10, v_id, 'M'),
      ('ring-avery-size-10', 11, v_id, 'N'),
      ('ring-avery-size-11', 12, v_id, 'O'),
      ('ring-avery-size-12', 13, v_id, 'P'),
      ('ring-avery-size-13', 14, v_id, 'Q'),
      ('ring-avery-size-14', 15, v_id, 'R'),
      ('ring-avery-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-avery-specs',
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
    'ring-ayla',
    'Ayla',
    'Ayla - Classic Radiant Claw Trilogy Engagement Ring',
    'Ayla reimagines the classic trilogy with three matching radiant-cut stones, each held in refined eagle-claw settings. A cathedral foundation elevates each stone, bringing balance, symmetry, and structural clarity. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'radiant'::enum_ring_shape,
    'trilogy'::enum_ring_setting_style,
    'plain'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-ayla';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-ayla-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/ayla/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/ayla/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-ayla-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/ayla/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/ayla/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-ayla-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/ayla/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/ayla/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-ayla-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-ayla-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-ayla-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-ayla-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-ayla-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-ayla-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-ayla-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-ayla-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-ayla-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-ayla-size-0', 1, v_id, 'D'),
      ('ring-ayla-size-1', 2, v_id, 'E'),
      ('ring-ayla-size-2', 3, v_id, 'F'),
      ('ring-ayla-size-3', 4, v_id, 'G'),
      ('ring-ayla-size-4', 5, v_id, 'H'),
      ('ring-ayla-size-5', 6, v_id, 'I'),
      ('ring-ayla-size-6', 7, v_id, 'J'),
      ('ring-ayla-size-7', 8, v_id, 'K'),
      ('ring-ayla-size-8', 9, v_id, 'L'),
      ('ring-ayla-size-9', 10, v_id, 'M'),
      ('ring-ayla-size-10', 11, v_id, 'N'),
      ('ring-ayla-size-11', 12, v_id, 'O'),
      ('ring-ayla-size-12', 13, v_id, 'P'),
      ('ring-ayla-size-13', 14, v_id, 'Q'),
      ('ring-ayla-size-14', 15, v_id, 'R'),
      ('ring-ayla-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-ayla-specs',
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
    'ring-bella',
    'Bella',
    'Bella - Oval 4 Claw Solitaire with Clustered Round Shoulder Stones Engagement Ring',
    'Vintage in style, Bella is a beautiful oval solitaire design framed by ten round cut side stones set low in a basket setting. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'oval'::enum_ring_shape,
    'solitaire'::enum_ring_setting_style,
    'plain'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-bella';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-bella-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/bella/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/bella/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-bella-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/bella/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/bella/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-bella-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/bella/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/bella/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-bella-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-bella-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-bella-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-bella-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-bella-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-bella-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-bella-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-bella-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-bella-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-bella-size-0', 1, v_id, 'D'),
      ('ring-bella-size-1', 2, v_id, 'E'),
      ('ring-bella-size-2', 3, v_id, 'F'),
      ('ring-bella-size-3', 4, v_id, 'G'),
      ('ring-bella-size-4', 5, v_id, 'H'),
      ('ring-bella-size-5', 6, v_id, 'I'),
      ('ring-bella-size-6', 7, v_id, 'J'),
      ('ring-bella-size-7', 8, v_id, 'K'),
      ('ring-bella-size-8', 9, v_id, 'L'),
      ('ring-bella-size-9', 10, v_id, 'M'),
      ('ring-bella-size-10', 11, v_id, 'N'),
      ('ring-bella-size-11', 12, v_id, 'O'),
      ('ring-bella-size-12', 13, v_id, 'P'),
      ('ring-bella-size-13', 14, v_id, 'Q'),
      ('ring-bella-size-14', 15, v_id, 'R'),
      ('ring-bella-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-bella-specs',
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
    'ring-bethany',
    'Bethany',
    'Bethany - Oval 4 Claw Solitaire with Hidden Halo, Tapered Band and Cathedral High Setting Engagement Ring',
    'Bethany adds a distinct flair to the timeless oval solitaire design with a tapered band, cathedral-style setting and sparkling hidden halo. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'oval'::enum_ring_shape,
    'halo'::enum_ring_setting_style,
    'plain'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-bethany';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-bethany-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/bethany/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/bethany/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-bethany-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/bethany/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/bethany/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-bethany-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/bethany/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/bethany/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-bethany-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-bethany-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-bethany-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-bethany-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-bethany-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-bethany-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-bethany-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-bethany-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-bethany-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-bethany-size-0', 1, v_id, 'D'),
      ('ring-bethany-size-1', 2, v_id, 'E'),
      ('ring-bethany-size-2', 3, v_id, 'F'),
      ('ring-bethany-size-3', 4, v_id, 'G'),
      ('ring-bethany-size-4', 5, v_id, 'H'),
      ('ring-bethany-size-5', 6, v_id, 'I'),
      ('ring-bethany-size-6', 7, v_id, 'J'),
      ('ring-bethany-size-7', 8, v_id, 'K'),
      ('ring-bethany-size-8', 9, v_id, 'L'),
      ('ring-bethany-size-9', 10, v_id, 'M'),
      ('ring-bethany-size-10', 11, v_id, 'N'),
      ('ring-bethany-size-11', 12, v_id, 'O'),
      ('ring-bethany-size-12', 13, v_id, 'P'),
      ('ring-bethany-size-13', 14, v_id, 'Q'),
      ('ring-bethany-size-14', 15, v_id, 'R'),
      ('ring-bethany-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-bethany-specs',
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
    'ring-bindi',
    'Bindi',
    'Bindi - Round 4 Claw Solitaire with Hidden Halo Engagement Ring',
    'Bindi is an exquisite round solitaire boasting four eagle-tipped claws and a dainty hidden halo. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'round'::enum_ring_shape,
    'halo'::enum_ring_setting_style,
    'plain'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-bindi';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-bindi-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/bindi/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/bindi/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-bindi-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/bindi/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/bindi/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-bindi-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/bindi/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/bindi/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-bindi-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-bindi-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-bindi-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-bindi-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-bindi-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-bindi-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-bindi-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-bindi-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-bindi-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-bindi-size-0', 1, v_id, 'D'),
      ('ring-bindi-size-1', 2, v_id, 'E'),
      ('ring-bindi-size-2', 3, v_id, 'F'),
      ('ring-bindi-size-3', 4, v_id, 'G'),
      ('ring-bindi-size-4', 5, v_id, 'H'),
      ('ring-bindi-size-5', 6, v_id, 'I'),
      ('ring-bindi-size-6', 7, v_id, 'J'),
      ('ring-bindi-size-7', 8, v_id, 'K'),
      ('ring-bindi-size-8', 9, v_id, 'L'),
      ('ring-bindi-size-9', 10, v_id, 'M'),
      ('ring-bindi-size-10', 11, v_id, 'N'),
      ('ring-bindi-size-11', 12, v_id, 'O'),
      ('ring-bindi-size-12', 13, v_id, 'P'),
      ('ring-bindi-size-13', 14, v_id, 'Q'),
      ('ring-bindi-size-14', 15, v_id, 'R'),
      ('ring-bindi-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-bindi-specs',
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
    'ring-billie',
    'Billie',
    'Billie - Elongated Cushion Bezel Solitaire with Cathedral Setting Engagement Ring',
    'Billie is a stunning bezel-set elongated cushion solitaire set within a sweeping cathedral band. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'elongated_cushion'::enum_ring_shape,
    'bezel'::enum_ring_setting_style,
    'plain'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-billie';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-billie-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/billie/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/billie/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-billie-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/billie/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/billie/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-billie-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/billie/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/billie/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-billie-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-billie-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-billie-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-billie-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-billie-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-billie-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-billie-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-billie-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-billie-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-billie-size-0', 1, v_id, 'D'),
      ('ring-billie-size-1', 2, v_id, 'E'),
      ('ring-billie-size-2', 3, v_id, 'F'),
      ('ring-billie-size-3', 4, v_id, 'G'),
      ('ring-billie-size-4', 5, v_id, 'H'),
      ('ring-billie-size-5', 6, v_id, 'I'),
      ('ring-billie-size-6', 7, v_id, 'J'),
      ('ring-billie-size-7', 8, v_id, 'K'),
      ('ring-billie-size-8', 9, v_id, 'L'),
      ('ring-billie-size-9', 10, v_id, 'M'),
      ('ring-billie-size-10', 11, v_id, 'N'),
      ('ring-billie-size-11', 12, v_id, 'O'),
      ('ring-billie-size-12', 13, v_id, 'P'),
      ('ring-billie-size-13', 14, v_id, 'Q'),
      ('ring-billie-size-14', 15, v_id, 'R'),
      ('ring-billie-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-billie-specs',
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
    'ring-blair',
    'Blair',
    'Blair - Oval 4 Claw Solitaire with Split Shank and Cathedral Setting Engagement Ring',
    'The Blair engagement ring adds a distinct quality to the classic oval solitaire design with a uniquely divergent band seated within a cathedral 4-claw setting. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'oval'::enum_ring_shape,
    'solitaire'::enum_ring_setting_style,
    'plain'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-blair';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-blair-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/blair/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/blair/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-blair-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/blair/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/blair/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-blair-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/blair/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/blair/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-blair-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-blair-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-blair-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-blair-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-blair-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-blair-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-blair-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-blair-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-blair-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-blair-size-0', 1, v_id, 'D'),
      ('ring-blair-size-1', 2, v_id, 'E'),
      ('ring-blair-size-2', 3, v_id, 'F'),
      ('ring-blair-size-3', 4, v_id, 'G'),
      ('ring-blair-size-4', 5, v_id, 'H'),
      ('ring-blair-size-5', 6, v_id, 'I'),
      ('ring-blair-size-6', 7, v_id, 'J'),
      ('ring-blair-size-7', 8, v_id, 'K'),
      ('ring-blair-size-8', 9, v_id, 'L'),
      ('ring-blair-size-9', 10, v_id, 'M'),
      ('ring-blair-size-10', 11, v_id, 'N'),
      ('ring-blair-size-11', 12, v_id, 'O'),
      ('ring-blair-size-12', 13, v_id, 'P'),
      ('ring-blair-size-13', 14, v_id, 'Q'),
      ('ring-blair-size-14', 15, v_id, 'R'),
      ('ring-blair-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-blair-specs',
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
    'ring-blossom',
    'Blossom',
    'Blossom - Pear Claw Solitaire with Petal Gallery and Accented Tiara Detail Engagement Ring',
    'Blossom centres a pear stone in a refined five-claw setting, framed by a sculpted petal gallery. A discreet tiara-style hidden halo sits beneath, adding quiet detail and soft, modern structure. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'pear'::enum_ring_shape,
    'solitaire'::enum_ring_setting_style,
    'accents'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-blossom';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-blossom-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/blossom/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/blossom/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-blossom-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/blossom/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/blossom/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-blossom-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/blossom/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/blossom/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-blossom-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-blossom-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-blossom-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-blossom-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-blossom-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-blossom-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-blossom-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-blossom-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-blossom-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-blossom-size-0', 1, v_id, 'D'),
      ('ring-blossom-size-1', 2, v_id, 'E'),
      ('ring-blossom-size-2', 3, v_id, 'F'),
      ('ring-blossom-size-3', 4, v_id, 'G'),
      ('ring-blossom-size-4', 5, v_id, 'H'),
      ('ring-blossom-size-5', 6, v_id, 'I'),
      ('ring-blossom-size-6', 7, v_id, 'J'),
      ('ring-blossom-size-7', 8, v_id, 'K'),
      ('ring-blossom-size-8', 9, v_id, 'L'),
      ('ring-blossom-size-9', 10, v_id, 'M'),
      ('ring-blossom-size-10', 11, v_id, 'N'),
      ('ring-blossom-size-11', 12, v_id, 'O'),
      ('ring-blossom-size-12', 13, v_id, 'P'),
      ('ring-blossom-size-13', 14, v_id, 'Q'),
      ('ring-blossom-size-14', 15, v_id, 'R'),
      ('ring-blossom-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-blossom-specs',
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
    'ring-bonnie',
    'Bonnie',
    'Bonnie - Round 4 Claw Solitaire with Hidden Halo and Cathedral Setting Engagement Ring',
    'Seated atop a spectacular cathedral setting, Bonnie is a beautiful round solitaire with four eagle-tipped claws and a sparkling hidden halo. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'round'::enum_ring_shape,
    'halo'::enum_ring_setting_style,
    'plain'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-bonnie';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-bonnie-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/bonnie/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/bonnie/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-bonnie-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/bonnie/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/bonnie/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-bonnie-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/bonnie/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/bonnie/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-bonnie-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-bonnie-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-bonnie-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-bonnie-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-bonnie-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-bonnie-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-bonnie-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-bonnie-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-bonnie-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-bonnie-size-0', 1, v_id, 'D'),
      ('ring-bonnie-size-1', 2, v_id, 'E'),
      ('ring-bonnie-size-2', 3, v_id, 'F'),
      ('ring-bonnie-size-3', 4, v_id, 'G'),
      ('ring-bonnie-size-4', 5, v_id, 'H'),
      ('ring-bonnie-size-5', 6, v_id, 'I'),
      ('ring-bonnie-size-6', 7, v_id, 'J'),
      ('ring-bonnie-size-7', 8, v_id, 'K'),
      ('ring-bonnie-size-8', 9, v_id, 'L'),
      ('ring-bonnie-size-9', 10, v_id, 'M'),
      ('ring-bonnie-size-10', 11, v_id, 'N'),
      ('ring-bonnie-size-11', 12, v_id, 'O'),
      ('ring-bonnie-size-12', 13, v_id, 'P'),
      ('ring-bonnie-size-13', 14, v_id, 'Q'),
      ('ring-bonnie-size-14', 15, v_id, 'R'),
      ('ring-bonnie-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-bonnie-specs',
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
    'ring-brandi',
    'Brandi',
    'Brandi - Oval 4 Claw Solitaire with Marquise-Round Accent Stones and Hidden Halo Engagement Ring',
    'The striking Brandi design showcases a stunning 4-claw oval cut centre stone, sparkling hidden halo and a sleek band featuring two pairs of round and marquise cut side stones. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'oval'::enum_ring_shape,
    'halo'::enum_ring_setting_style,
    'accents'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-brandi';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-brandi-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/brandi/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/brandi/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-brandi-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/brandi/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/brandi/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-brandi-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/brandi/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/brandi/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-brandi-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-brandi-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-brandi-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-brandi-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-brandi-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-brandi-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-brandi-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-brandi-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-brandi-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-brandi-size-0', 1, v_id, 'D'),
      ('ring-brandi-size-1', 2, v_id, 'E'),
      ('ring-brandi-size-2', 3, v_id, 'F'),
      ('ring-brandi-size-3', 4, v_id, 'G'),
      ('ring-brandi-size-4', 5, v_id, 'H'),
      ('ring-brandi-size-5', 6, v_id, 'I'),
      ('ring-brandi-size-6', 7, v_id, 'J'),
      ('ring-brandi-size-7', 8, v_id, 'K'),
      ('ring-brandi-size-8', 9, v_id, 'L'),
      ('ring-brandi-size-9', 10, v_id, 'M'),
      ('ring-brandi-size-10', 11, v_id, 'N'),
      ('ring-brandi-size-11', 12, v_id, 'O'),
      ('ring-brandi-size-12', 13, v_id, 'P'),
      ('ring-brandi-size-13', 14, v_id, 'Q'),
      ('ring-brandi-size-14', 15, v_id, 'R'),
      ('ring-brandi-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-brandi-specs',
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
    'ring-bree',
    'Bree',
    'Bree - Elongated Cushion 4 Claw Trilogy with Pear Side Stones and Pave Band Engagement Ring',
    'Inspired by the Meghan trilogy, the Bree engagement ring features a breathtaking elongated cushion cut centre stone, two pear cut side stones and a sweeping cathedral setting atop a 2/3 pavè band. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'elongated_cushion'::enum_ring_shape,
    'trilogy'::enum_ring_setting_style,
    'pave'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-bree';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-bree-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/bree/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/bree/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-bree-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/bree/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/bree/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-bree-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/bree/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/bree/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-bree-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-bree-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-bree-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-bree-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-bree-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-bree-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-bree-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-bree-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-bree-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-bree-size-0', 1, v_id, 'D'),
      ('ring-bree-size-1', 2, v_id, 'E'),
      ('ring-bree-size-2', 3, v_id, 'F'),
      ('ring-bree-size-3', 4, v_id, 'G'),
      ('ring-bree-size-4', 5, v_id, 'H'),
      ('ring-bree-size-5', 6, v_id, 'I'),
      ('ring-bree-size-6', 7, v_id, 'J'),
      ('ring-bree-size-7', 8, v_id, 'K'),
      ('ring-bree-size-8', 9, v_id, 'L'),
      ('ring-bree-size-9', 10, v_id, 'M'),
      ('ring-bree-size-10', 11, v_id, 'N'),
      ('ring-bree-size-11', 12, v_id, 'O'),
      ('ring-bree-size-12', 13, v_id, 'P'),
      ('ring-bree-size-13', 14, v_id, 'Q'),
      ('ring-bree-size-14', 15, v_id, 'R'),
      ('ring-bree-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-bree-specs',
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
    'ring-briar',
    'Briar',
    'Briar - Round 6 Claw Solitaire with Trellis Gallery, Pave Band and Cathedral Setting Engagement Ring',
    'The Briar engagement ring is a unique take on the classic round solitaire design with a beautiful woven trellis setting, six eagle-tipped claws and a sparkling 2/3 pavè band. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'round'::enum_ring_shape,
    'solitaire'::enum_ring_setting_style,
    'pave'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-briar';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-briar-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/briar/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/briar/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-briar-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/briar/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/briar/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-briar-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/briar/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/briar/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-briar-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-briar-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-briar-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-briar-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-briar-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-briar-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-briar-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-briar-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-briar-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-briar-size-0', 1, v_id, 'D'),
      ('ring-briar-size-1', 2, v_id, 'E'),
      ('ring-briar-size-2', 3, v_id, 'F'),
      ('ring-briar-size-3', 4, v_id, 'G'),
      ('ring-briar-size-4', 5, v_id, 'H'),
      ('ring-briar-size-5', 6, v_id, 'I'),
      ('ring-briar-size-6', 7, v_id, 'J'),
      ('ring-briar-size-7', 8, v_id, 'K'),
      ('ring-briar-size-8', 9, v_id, 'L'),
      ('ring-briar-size-9', 10, v_id, 'M'),
      ('ring-briar-size-10', 11, v_id, 'N'),
      ('ring-briar-size-11', 12, v_id, 'O'),
      ('ring-briar-size-12', 13, v_id, 'P'),
      ('ring-briar-size-13', 14, v_id, 'Q'),
      ('ring-briar-size-14', 15, v_id, 'R'),
      ('ring-briar-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-briar-specs',
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
    'ring-brooke',
    'Brooke',
    'Brooke - Pear 3 Claw Solitaire with Round Shoulder Stones Engagement Ring',
    'Brooke is a finely detailed pear solitaire design held within a 3-claw basket setting and framed each side by three round cut accent stones. Schedule an appointment with Cullen US today.',
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
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-brooke';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-brooke-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/brooke/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/brooke/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-brooke-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/brooke/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/brooke/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-brooke-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/brooke/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/brooke/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-brooke-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-brooke-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-brooke-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-brooke-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-brooke-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-brooke-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-brooke-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-brooke-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-brooke-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-brooke-size-0', 1, v_id, 'D'),
      ('ring-brooke-size-1', 2, v_id, 'E'),
      ('ring-brooke-size-2', 3, v_id, 'F'),
      ('ring-brooke-size-3', 4, v_id, 'G'),
      ('ring-brooke-size-4', 5, v_id, 'H'),
      ('ring-brooke-size-5', 6, v_id, 'I'),
      ('ring-brooke-size-6', 7, v_id, 'J'),
      ('ring-brooke-size-7', 8, v_id, 'K'),
      ('ring-brooke-size-8', 9, v_id, 'L'),
      ('ring-brooke-size-9', 10, v_id, 'M'),
      ('ring-brooke-size-10', 11, v_id, 'N'),
      ('ring-brooke-size-11', 12, v_id, 'O'),
      ('ring-brooke-size-12', 13, v_id, 'P'),
      ('ring-brooke-size-13', 14, v_id, 'Q'),
      ('ring-brooke-size-14', 15, v_id, 'R'),
      ('ring-brooke-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-brooke-specs',
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
    'ring-brooklyn',
    'Brooklyn',
    'Brooklyn - Princess 4 Claw Solitaire with Wrap Around Hidden Halo and Pave Band Engagement Ring',
    'Brooklyn is a classic 4-claw princess solitaire boasting a wrap-around hidden halo and half pavé band. Schedule an appointment with Cullen US today.',
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
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-brooklyn';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-brooklyn-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/brooklyn/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/brooklyn/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-brooklyn-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/brooklyn/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/brooklyn/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-brooklyn-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/brooklyn/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/brooklyn/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-brooklyn-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-brooklyn-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-brooklyn-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-brooklyn-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-brooklyn-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-brooklyn-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-brooklyn-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-brooklyn-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-brooklyn-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-brooklyn-size-0', 1, v_id, 'D'),
      ('ring-brooklyn-size-1', 2, v_id, 'E'),
      ('ring-brooklyn-size-2', 3, v_id, 'F'),
      ('ring-brooklyn-size-3', 4, v_id, 'G'),
      ('ring-brooklyn-size-4', 5, v_id, 'H'),
      ('ring-brooklyn-size-5', 6, v_id, 'I'),
      ('ring-brooklyn-size-6', 7, v_id, 'J'),
      ('ring-brooklyn-size-7', 8, v_id, 'K'),
      ('ring-brooklyn-size-8', 9, v_id, 'L'),
      ('ring-brooklyn-size-9', 10, v_id, 'M'),
      ('ring-brooklyn-size-10', 11, v_id, 'N'),
      ('ring-brooklyn-size-11', 12, v_id, 'O'),
      ('ring-brooklyn-size-12', 13, v_id, 'P'),
      ('ring-brooklyn-size-13', 14, v_id, 'Q'),
      ('ring-brooklyn-size-14', 15, v_id, 'R'),
      ('ring-brooklyn-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-brooklyn-specs',
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
    'ring-bronte',
    'Bronte',
    'Bronte - Oval 4 Claw Solitaire with Cigar Band and Hidden Halo Engagement Ring',
    'Bronte features a 4-claw oval solitaire, sparkling hidden halo and thick cigar band. This beautiful engagement ring is available in both high and low setting heights. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'oval'::enum_ring_shape,
    'halo'::enum_ring_setting_style,
    'plain'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-bronte';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-bronte-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/bronte/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/bronte/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-bronte-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/bronte/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/bronte/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-bronte-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/bronte/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/bronte/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-bronte-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-bronte-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-bronte-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-bronte-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-bronte-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-bronte-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-bronte-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-bronte-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-bronte-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-bronte-size-0', 1, v_id, 'D'),
      ('ring-bronte-size-1', 2, v_id, 'E'),
      ('ring-bronte-size-2', 3, v_id, 'F'),
      ('ring-bronte-size-3', 4, v_id, 'G'),
      ('ring-bronte-size-4', 5, v_id, 'H'),
      ('ring-bronte-size-5', 6, v_id, 'I'),
      ('ring-bronte-size-6', 7, v_id, 'J'),
      ('ring-bronte-size-7', 8, v_id, 'K'),
      ('ring-bronte-size-8', 9, v_id, 'L'),
      ('ring-bronte-size-9', 10, v_id, 'M'),
      ('ring-bronte-size-10', 11, v_id, 'N'),
      ('ring-bronte-size-11', 12, v_id, 'O'),
      ('ring-bronte-size-12', 13, v_id, 'P'),
      ('ring-bronte-size-13', 14, v_id, 'Q'),
      ('ring-bronte-size-14', 15, v_id, 'R'),
      ('ring-bronte-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-bronte-specs',
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

