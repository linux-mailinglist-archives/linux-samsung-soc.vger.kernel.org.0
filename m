Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2CBD62696C1
	for <lists+linux-samsung-soc@lfdr.de>; Mon, 14 Sep 2020 22:34:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726095AbgINUen (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Mon, 14 Sep 2020 16:34:43 -0400
Received: from mail-il1-f193.google.com ([209.85.166.193]:34529 "EHLO
        mail-il1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726192AbgINUej (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 14 Sep 2020 16:34:39 -0400
Received: by mail-il1-f193.google.com with SMTP id a8so909508ilk.1;
        Mon, 14 Sep 2020 13:34:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=8SKqdAzj3Ng3db21P1hBsfC6jbYXvAGRvhEU1dLjCy0=;
        b=bT0VGJWNMWWJqIYiwTXUxGyO8aLa7XY0YxCaZO7MEygsqHl2vC7Nm2wP5Mjorpn0hR
         9CP3UCBqgqP4euPw7D1nMPdYsTkCe1zDf+dVXcRWpDMSLiGn0FbBsQKatJqj4rTd1qxU
         mHzugtLniASd9qQr24RADnVtQ65h86baatHlDvlzY0cdMwB1cdTgM55C1kpFFII9Wv8i
         cK2t4Zn5e+YFBt2jXuxeC3FXGR9OcZjy5vSHtYMf9mBJQGF/6LKQQdgcy+tLFKyZZDhu
         mic/OjfKoyXlc/8331gX4iKMGakqViXn5JAoDf2s9u7KNaawGSEHyiibEBoJRO8HSLi4
         8jLA==
X-Gm-Message-State: AOAM531PJ9X9FLCkS/GmY61YIFNfCbKLb3RP8Pzc5i9wqU1HsgthKhZE
        xNSS2kS4TTqMWrn6j3Y7sMYq4uEll8H/
X-Google-Smtp-Source: ABdhPJxTC+W/I4vkanS89qGG5f+QFVC8794VQm6dKbtPPcaUtcWXXjBDA4AnUdwyJFDUfO5I9tQDaA==
X-Received: by 2002:a92:7711:: with SMTP id s17mr5622477ilc.236.1600115678338;
        Mon, 14 Sep 2020 13:34:38 -0700 (PDT)
Received: from xps15 ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id s6sm7288807ilp.4.2020.09.14.13.34.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2020 13:34:37 -0700 (PDT)
Received: (nullmailer pid 197071 invoked by uid 1000);
        Mon, 14 Sep 2020 20:34:36 -0000
Date:   Mon, 14 Sep 2020 14:34:36 -0600
From:   Rob Herring <robh@kernel.org>
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     devicetree@vger.kernel.org,
        "David S. Miller" <davem@davemloft.net>,
        Vladimir Zapolskiy <vz@mleia.com>,
        linux-kernel@vger.kernel.org,
        Kamil Konieczny <k.konieczny@samsung.com>,
        linux-crypto@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        linux-samsung-soc@vger.kernel.org,
        Herbert Xu <herbert@gondor.apana.org.au>
Subject: Re: [PATCH 1/3] dt-bindings: crypto: slimsss: Correct a typo in
 compatible
Message-ID: <20200914203436.GA197037@bogus>
References: <20200903180400.2865-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200903180400.2865-1-krzk@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Thu, 03 Sep 2020 20:03:58 +0200, Krzysztof Kozlowski wrote:
> Correct a typo in the compatible - missing trailing 's'.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  Documentation/devicetree/bindings/crypto/samsung-slimsss.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Applied, thanks!
