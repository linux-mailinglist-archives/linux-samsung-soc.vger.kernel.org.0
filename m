Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C11815516F
	for <lists+linux-samsung-soc@lfdr.de>; Tue, 25 Jun 2019 16:20:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729727AbfFYOUg (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Tue, 25 Jun 2019 10:20:36 -0400
Received: from mail-ed1-f65.google.com ([209.85.208.65]:39307 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727070AbfFYOUg (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 25 Jun 2019 10:20:36 -0400
Received: by mail-ed1-f65.google.com with SMTP id m10so27433919edv.6
        for <linux-samsung-soc@vger.kernel.org>; Tue, 25 Jun 2019 07:20:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=sender:date:from:to:cc:subject:message-id:mail-followup-to
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=G6JtZL8+U2ZkwL0/tzXXiHIEAOss9zM+ZL3Pgbc8Mpk=;
        b=PiKb0pq4SASNR7D3rZRPPn6hYPGCPxODqKLMDAnrrKgPg9InzXFNxhgfcjJ0osnNob
         vyTtVKNuYim6MRswZ9WjaRBlsW8RMJPiwWKoyq3uAyYbDouZ9ZJClJkEADyVHPrEnO5E
         2dv49ZPpK3sQqXzRaWmoTu0NM4VYZANoTUsRE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to:user-agent;
        bh=G6JtZL8+U2ZkwL0/tzXXiHIEAOss9zM+ZL3Pgbc8Mpk=;
        b=BOuui0YbZRjBvtyqHw+NU4m0/YebrOHI3/HV6dhw3c6vXkpLON8lXJmoI3cd7423gE
         /4x67XtRFoZF8nZp72k2Olv00uCCkjKtBcQY24xddpKCtThJpVA6Uv6uEXzFkQTRtA6O
         34at8OTRU1PLv7zJYnjQmwiCtrV2+5LzAyPAV3vo+0NpgYkHBbt+5FY181rOUfPgp6U0
         e5MXWnbpLUyG2PnwgdxGdB73RqzmQcCvSeP5UE+jVSSQnnZ5w7zVfwPaFpB+poc0AgZb
         fOhHlok/NDAvDv72BdT0TSBoku2Gve9M7BesbCaEF49d5oPqVk2ug36ruNOj8pXU1wMc
         72kQ==
X-Gm-Message-State: APjAAAWNLVipMMSK3JVZgXGkUFepsXDPeMHWRSoEqOvU8Mgp1ih1JHZ4
        t3KgBgaTTt2xAR1uZ4nuVKnYzA==
X-Google-Smtp-Source: APXvYqzf+qJgnUeqQvG0q196yIL7BFlfF2ImhuXnDKq2Nc9RZ6ZHCnGm/JBXEdesWWdkz8OViVV3qw==
X-Received: by 2002:a05:6402:78c:: with SMTP id d12mr111470360edy.160.1561472434802;
        Tue, 25 Jun 2019 07:20:34 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
        by smtp.gmail.com with ESMTPSA id n15sm4863868edd.49.2019.06.25.07.20.33
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 25 Jun 2019 07:20:33 -0700 (PDT)
Date:   Tue, 25 Jun 2019 16:20:31 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Russell King - ARM Linux admin <linux@armlinux.org.uk>
Cc:     Daniel Vetter <daniel@ffwll.ch>,
        Emil Velikov <emil.velikov@collabora.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org,
        Joonyoung Shim <jy0922.shim@samsung.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
        Inki Dae <inki.dae@samsung.com>,
        David Airlie <airlied@linux.ie>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Kukjin Kim <kgene@kernel.org>, dri-devel@lists.freedesktop.org,
        kernel@collabora.com, Sean Paul <sean@poorly.run>,
        linux-kernel@vger.kernel.org, m.szyprowski@samsung.com
Subject: Re: [PATCH 0/2] Associate ddc adapters with connectors
Message-ID: <20190625142031.GV12905@phenom.ffwll.local>
Mail-Followup-To: Russell King - ARM Linux admin <linux@armlinux.org.uk>,
        Emil Velikov <emil.velikov@collabora.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org,
        Joonyoung Shim <jy0922.shim@samsung.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
        Inki Dae <inki.dae@samsung.com>, David Airlie <airlied@linux.ie>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Kukjin Kim <kgene@kernel.org>, dri-devel@lists.freedesktop.org,
        kernel@collabora.com, Sean Paul <sean@poorly.run>,
        linux-kernel@vger.kernel.org, m.szyprowski@samsung.com
References: <cover.1561452052.git.andrzej.p@collabora.com>
 <20190625100351.52ddptvb2gizaepi@shell.armlinux.org.uk>
 <817ccfba-754c-6a28-8d75-63f70605fd43@collabora.com>
 <20190625133639.GA16031@arch-x1c3>
 <20190625140755.GT12905@phenom.ffwll.local>
 <20190625141032.5jiy2oekb3olaejd@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190625141032.5jiy2oekb3olaejd@shell.armlinux.org.uk>
X-Operating-System: Linux phenom 4.19.0-5-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Tue, Jun 25, 2019 at 03:10:32PM +0100, Russell King - ARM Linux admin wrote:
> On Tue, Jun 25, 2019 at 04:07:55PM +0200, Daniel Vetter wrote:
> > Otherwise I like this. Biggest problem I'm seeing here is rolling this out
> > everywhere, this is a lot of work. And without widespread adoptions it's
> > not terribly useful for userspace.
> 
> There will be cases where it's not possible, because the I2C bus is
> hidden behind a chip that doesn't give you direct access to the DDC
> bus.

Oh sure, plus lots of connectors where there's just not ddc bus at all.
But if we only roll this out for a handful of drivers it's also not great,
that's what I meant. Looking at

$ git grep drm_do_get_edid

there's only very few drivers where the ddc bus is hidden. There's a lot
more where it's not, and I think a big series to tackle those would serve
extremely well to make a case for this sysfs link.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
