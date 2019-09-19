Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 08302B74AA
	for <lists+linux-samsung-soc@lfdr.de>; Thu, 19 Sep 2019 10:02:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728879AbfISIC3 (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Thu, 19 Sep 2019 04:02:29 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:37803 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725887AbfISIC3 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 19 Sep 2019 04:02:29 -0400
Received: by mail-wr1-f66.google.com with SMTP id i1so2018925wro.4;
        Thu, 19 Sep 2019 01:02:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=SfW624VpOh0aCeKTvJvcsqXpDKgHZe+aad1WQIwP3kA=;
        b=hKPKBxGiP1dtGKbC/ili2EWdhdo11fRn3GsYmFocyqo9iu5O06f+CcFh4GpTRJ8Jsq
         Lhcoqo0XD8ue94r7HEzcDfa2any8wdXvEwOc9+1gxofCiziI7tCQ5Xz/UBU3cd94UrDb
         KfIY0YO3tRllVUNClrxxk67/i3Sk//RR+ZPjtaTw84HHXH1TeOpfGamEuu+2t6+n2CCC
         WxCyNXrxP+kOSzO+/w4fzPbzuXg8etVEAMMzEyW6Z598Rl19YPWZWIgjgmCvFegWgjQa
         6WxlEdcFIaa/wOvqjgG12qa3UR3ERML304M/CX8XQNCeDz3alBF6rynWpw2c+RB46kBs
         KGfQ==
X-Gm-Message-State: APjAAAW3q5LUJrBgyABSx3gFOAl7gleRtohpowu24I/Rbf8i8GQMnx8K
        IvUu00Q14hJ3b4Z0CtFHz7E=
X-Google-Smtp-Source: APXvYqzpf0vjeib7NNrcjA+Yo77SrkzTdVAWHJEkVgM1iNVu//ag/XfAaiA0hMbWW06lh2Ab4sMSUw==
X-Received: by 2002:adf:84c6:: with SMTP id 64mr5862285wrg.287.1568880146542;
        Thu, 19 Sep 2019 01:02:26 -0700 (PDT)
Received: from pi3 ([194.230.155.145])
        by smtp.googlemail.com with ESMTPSA id y186sm8506032wmd.26.2019.09.19.01.02.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Sep 2019 01:02:25 -0700 (PDT)
Date:   Thu, 19 Sep 2019 10:02:23 +0200
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc:     broonie@kernel.org, lgirdwood@gmail.com,
        ckeepax@opensource.cirrus.com, sbkim73@samsung.com,
        alsa-devel@alsa-project.org, robh+dt@kernel.org,
        devicetree@vger.kernel.org, patches@opensource.cirrus.com,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, b.zolnierkie@samsung.com,
        m.szyprowski@samsung.com
Subject: Re: [PATCH v1 6/9] ASoC: dt-bindings: Document
 "samsung,arndale-wm1811" compatible
Message-ID: <20190919080223.GE13195@pi3>
References: <20190918104634.15216-1-s.nawrocki@samsung.com>
 <CGME20190918104703eucas1p1a06ecce433753ba42b422317ec7db48c@eucas1p1.samsung.com>
 <20190918104634.15216-7-s.nawrocki@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190918104634.15216-7-s.nawrocki@samsung.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Wed, Sep 18, 2019 at 12:46:31PM +0200, Sylwester Nawrocki wrote:
> Add compatible string for boards with WM1811 CODEC to the list.
> 
> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> ---
>  Documentation/devicetree/bindings/sound/arndale.txt | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)

Acked-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof

