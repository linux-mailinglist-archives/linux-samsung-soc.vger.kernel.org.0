Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 85E14C095F
	for <lists+linux-samsung-soc@lfdr.de>; Fri, 27 Sep 2019 18:17:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727472AbfI0QRz (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Fri, 27 Sep 2019 12:17:55 -0400
Received: from mail-oi1-f194.google.com ([209.85.167.194]:46692 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727289AbfI0QRz (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 27 Sep 2019 12:17:55 -0400
Received: by mail-oi1-f194.google.com with SMTP id k25so5637294oiw.13;
        Fri, 27 Sep 2019 09:17:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=61wEmdcrcYWJhNxd2306tXwFPpNdjt5BEaPJ4YXafyM=;
        b=sl2ZolqmqV65Ztk3sHxZHCOV9aPauDlkF3GUgvy9RMLDCDMA6LdpL6MiChww3mRzcd
         D95lfweaY2gMu1daH2hJgeYQ6YtXi2CYouPz+41WXa2livWvCqgp1+ejnJxowPp25YwO
         9qbzD/prS7WrGUF9zAZcOKKBcaRHUY45lwdK55HnBUZr3/co7aLd7ancJRnCxO9JLoU3
         iJ/rAxy815MYq5S/a403j12db7rcY7hc6D00J5QZKojQp3RUeHXcHaiBsgc58mVI7yf1
         wdRhI3N3A8Y4qGwzB/wuS1dCfFfZ0hYOqKjDsf+I/P6k+tLaBIPIHf73IIyCQLyHOoB1
         orsA==
X-Gm-Message-State: APjAAAUQrVbwHwYKI/IusXJ6P0CT0KmMv7USBRMSDu8lqhKalelXiWWA
        MwGj5MrEearwrrleTjtKQxYXxeY=
X-Google-Smtp-Source: APXvYqzQ50C+MzxL+jlDDEzxwVOUDJXNh2/Ri5dfX21zjNX52KVp6n8DSiAfRPZ1iIKlDQ96r5QBdw==
X-Received: by 2002:aca:d58c:: with SMTP id m134mr7507074oig.178.1569601074750;
        Fri, 27 Sep 2019 09:17:54 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id l81sm1778474oih.10.2019.09.27.09.17.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Sep 2019 09:17:54 -0700 (PDT)
Date:   Fri, 27 Sep 2019 11:17:53 -0500
From:   Rob Herring <robh@kernel.org>
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
        linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Maciej Falkowski <m.falkowski@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH v5] dt-bindings: sound: Convert Samsung I2S controller to
  dt-schema
Message-ID: <20190927161753.GA30805@bogus>
References: <CGME20190925132644eucas1p2716a805d184f9bbc4ad7a94cc9cca633@eucas1p2.samsung.com>
 <20190925132628.31858-1-m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190925132628.31858-1-m.szyprowski@samsung.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Wed, 25 Sep 2019 15:26:28 +0200, Marek Szyprowski wrote:
> From: Maciej Falkowski <m.falkowski@samsung.com>
> 
> Convert Samsung I2S controller to newer dt-schema format.
> 
> Signed-off-by: Maciej Falkowski <m.falkowski@samsung.com>
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
> v5:
> - Removed '#clock-cells' property from required properties
> - Added deprecated property to 'clock-output-names'
> and removed corresponding comment. 
> 
> Best regards, 
> Maciej Falkowski
> ---
>  .../devicetree/bindings/sound/samsung-i2s.txt |  84 -----------
>  .../bindings/sound/samsung-i2s.yaml           | 136 ++++++++++++++++++
>  2 files changed, 136 insertions(+), 84 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/sound/samsung-i2s.txt
>  create mode 100644 Documentation/devicetree/bindings/sound/samsung-i2s.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
