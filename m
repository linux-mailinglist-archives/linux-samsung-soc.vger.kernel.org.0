Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 24F9ABB1EF
	for <lists+linux-samsung-soc@lfdr.de>; Mon, 23 Sep 2019 12:10:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405643AbfIWKKD (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Mon, 23 Sep 2019 06:10:03 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:35875 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405389AbfIWKKD (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 23 Sep 2019 06:10:03 -0400
Received: by mail-wm1-f65.google.com with SMTP id m18so8620943wmc.1;
        Mon, 23 Sep 2019 03:10:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=h9qXlBn1SwboKu5LtxJjQDTNKEcy+/lavbTXOBsjGHM=;
        b=bY+mHPeyAFJik7UQhJyESFoWV6qxWdr9WsK4+VSn3dLxy48ZwCXZ2T5Nsm02IWGIxH
         8+i6pCPrcFC/wpPTh7z6LIrvtoJkitEywYT8MYlb4gKPrz6yjPkbJ/RIB5n+n4G9n8tw
         WCzu/lh9w+hZiTj+6bnuPER5i5Kqqstnoa39uja3Rkr90k3Radqu3HXnyhk+HOOEmZE0
         BK+W27FDobZ9+mFIC+Xznrr7eQwC5V8cc2L8JjAddt404cA25Bz7TlMG4Odu7QBWvXWm
         FS0IEdZmfKvTmCNgR7CkKlHUfp2bvysCjAMvXhTq+Z30bL3OvzGMOuzetb0cNFx01cXh
         heMw==
X-Gm-Message-State: APjAAAW4FntxOCcucdzjbmRCswrhdkiuCfjgFMYW3ZyYBWRSNqa6lEvS
        hNTbQ6NkdrfmHMT/LTGfgxM=
X-Google-Smtp-Source: APXvYqwZ70GVq/wsIIytWY8nE0tIFLrgynh5FI/RtkKc0x6HwJVU1rez82f8Fjm1XocHptXshd8PFg==
X-Received: by 2002:a1c:150:: with SMTP id 77mr2056857wmb.116.1569233401030;
        Mon, 23 Sep 2019 03:10:01 -0700 (PDT)
Received: from pi3 ([194.230.155.145])
        by smtp.googlemail.com with ESMTPSA id l9sm9539317wme.45.2019.09.23.03.09.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Sep 2019 03:10:00 -0700 (PDT)
Date:   Mon, 23 Sep 2019 12:09:57 +0200
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc:     ckeepax@opensource.cirrus.com, broonie@kernel.org,
        lgirdwood@gmail.com, sbkim73@samsung.com,
        alsa-devel@alsa-project.org, robh+dt@kernel.org,
        devicetree@vger.kernel.org, patches@opensource.cirrus.com,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, b.zolnierkie@samsung.com,
        m.szyprowski@samsung.com
Subject: Re: [PATCH v2 03/10] ASoC: wm8994: Add support for setting MCLK
 clock rate
Message-ID: <20190923100957.GA4723@pi3>
References: <20190920130218.32690-1-s.nawrocki@samsung.com>
 <CGME20190920130316eucas1p2de713006a13c62c0b895c2e33e0d14c7@eucas1p2.samsung.com>
 <20190920130218.32690-4-s.nawrocki@samsung.com>
 <7334ce45-f192-4421-aa3d-d142582153ef@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <7334ce45-f192-4421-aa3d-d142582153ef@samsung.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Mon, Sep 23, 2019 at 11:10:48AM +0200, Sylwester Nawrocki wrote:
> On 9/20/19 15:02, Sylwester Nawrocki wrote:
> > Extend the set_sysclk() handler so we also set frequency of the MCLK1,
> > MCLK2 clocks through clk API when those clocks are specified in DT.
> > 
> > Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> > Acked-by: Krzysztof Kozlowski <krzk@kernel.org>
> 
> Sorry, I squashed other patch to this one but forgot to remove above tags, 
> not sure if those still stand as there was rather significant change in 
> the patch. 

It's good. For the record:

Acked-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof

