Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8F25916FE8B
	for <lists+linux-samsung-soc@lfdr.de>; Wed, 26 Feb 2020 13:01:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726334AbgBZMB3 (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Wed, 26 Feb 2020 07:01:29 -0500
Received: from mail.kernel.org ([198.145.29.99]:58574 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726272AbgBZMB2 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 26 Feb 2020 07:01:28 -0500
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1FA2524689
        for <linux-samsung-soc@vger.kernel.org>; Wed, 26 Feb 2020 12:01:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1582718488;
        bh=FpyVEARCSs9sAMP2l7EIGOuJhsv40fMzjCPFhYKyj4o=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=Vu3VN9CwGtzFeQfoR9eLsEHD0DUPSiM/G3OakGBG86OEiacAutqDdeRic1S2jPSsF
         plGlXHzNdkrF9CKAGCCAZxCQt7E8VEnx4Q/cRjm0C0k2+8O4BCcbpculQEJEMAZnJj
         aRyJ3s5TGt/6rut0GVdIXSsnEI3p8YaUxbJLHy1Y=
Received: by mail-lj1-f169.google.com with SMTP id x14so2742093ljd.13
        for <linux-samsung-soc@vger.kernel.org>; Wed, 26 Feb 2020 04:01:28 -0800 (PST)
X-Gm-Message-State: ANhLgQ1JAdPava3VOppHQAvBi7R/OMSUIpnzLf2tB5lI72Gf+YLc8FEd
        umnjq3fAtCFtUVVTOV7aL+MDJRVu5yKSkOuaOuc=
X-Google-Smtp-Source: APXvYqy+ftYsndx8N+Hf9GSnSNYeI1qhCIZuvQ7Kh3v5UoS+yEzqmBHVTFmu9cW1XjynUq/5ObSBqifL/1L6V9TuexA=
X-Received: by 2002:a2e:9705:: with SMTP id r5mr2873915lji.114.1582718486296;
 Wed, 26 Feb 2020 04:01:26 -0800 (PST)
MIME-Version: 1.0
References: <CGME20200226101316eucas1p2fd16a7c821632084710167216b78f6c5@eucas1p2.samsung.com>
 <20200226101307.16708-1-m.szyprowski@samsung.com>
In-Reply-To: <20200226101307.16708-1-m.szyprowski@samsung.com>
From:   Krzysztof Kozlowski <krzk@kernel.org>
Date:   Wed, 26 Feb 2020 13:01:14 +0100
X-Gmail-Original-Message-ID: <CAJKOXPd8Ed9gHSmOf9psxhwDM9BW2C8if-UuoDZtz2cX4Yx4Ow@mail.gmail.com>
Message-ID: <CAJKOXPd8Ed9gHSmOf9psxhwDM9BW2C8if-UuoDZtz2cX4Yx4Ow@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: sii9234: silence warning about regulators
 during deferred probe
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     dri-devel@lists.freedesktop.org,
        "linux-samsung-soc@vger.kernel.org" 
        <linux-samsung-soc@vger.kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Wed, 26 Feb 2020 at 11:13, Marek Szyprowski <m.szyprowski@samsung.com> wrote:
>
> Don't confuse user with meaningless warning about failure in getting
> regulators in case of deferred probe.
>
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  drivers/gpu/drm/bridge/sii9234.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof
