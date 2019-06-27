Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E3EC45798C
	for <lists+linux-samsung-soc@lfdr.de>; Thu, 27 Jun 2019 04:34:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727215AbfF0Cd7 (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Wed, 26 Jun 2019 22:33:59 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:34548 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727186AbfF0Cd6 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 26 Jun 2019 22:33:58 -0400
Received: by mail-lj1-f196.google.com with SMTP id p17so669759ljg.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 26 Jun 2019 19:33:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lixom-net.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=YqSJkouCdbmz4bvieX9MmvoCdaOvWPYtwXCJEllW7aE=;
        b=ofOF3Pcn7Fsnx8bfodWEdspjWibel0QtIkMI76mLhMU7ufARyT4XCtgDrRSrGGAaPH
         K81LLtmZ6Cxq4q9nNfAoZuEyOD+4GJ++Q3J2LwIOnvLbG2irctb9GISDQhF2Rv4Y+TKM
         PxT8lCnp17sR7UZqooYTXhH7Q0sMtRDufezoy1+MEK2zb44VvZ7A9W4XkzsXk1N4fscL
         Lr5vh7kbqV6fBSWJSEFgua0OQFEokSfI9D59D+DB/iOunGtmjf5z/bLOCuGuD9/fHEZ2
         85jcYLHjrUu26mXDn0xj9dm1tu1VJ2S2KDh2G/fH2S2IcQ/R7XyzAm98dVUB1UBAKBD9
         PUrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=YqSJkouCdbmz4bvieX9MmvoCdaOvWPYtwXCJEllW7aE=;
        b=K35AU+SgFspHYc+wmJrQRC6iEtAav5IiJg4R1eW7sN3Wjcy+6M5O4STQMIZxxvea0s
         dfsJgN7XhZiI76ZlPkJBB0OjbTkBizu4i89vcOsmmNp8RJjam1HOAoWq2hdU4Dd32KWX
         k3VGvY1GX3AO5eKiyKa1u21AZYP5XYaOjGico5ZQX0D8kIFCMMsntBxlGsO1sHKzHQjy
         +6HI1lrMyRp7Ab56ImC2Wm7ZwemeM36O4MCTebGgaZ9n9zdEexKJNHzTRmdG+j0qJje0
         yi6GGFiZXXEMk+8S96AqstHEP9m+gZ3d3HXFgnGas46a4M0vQv8QAXd2Gn2BYGt7NOKu
         x26w==
X-Gm-Message-State: APjAAAXNRbb6peFUnCv+LGL6xXrP6X5gOKdMNa5EWNJriee567Cvl16e
        M/++d3tgEWk1gNkkO+Ezl2e+Qw==
X-Google-Smtp-Source: APXvYqzUo/OMOEtxCgRTsVH9uHTyjCrqs+2MYNudDPes4ncQUwwtP9ffEH64O9IdQtyZOyUc3YK1nA==
X-Received: by 2002:a2e:7c15:: with SMTP id x21mr872691ljc.55.1561602836467;
        Wed, 26 Jun 2019 19:33:56 -0700 (PDT)
Received: from localhost (h85-30-9-151.cust.a3fiber.se. [85.30.9.151])
        by smtp.gmail.com with ESMTPSA id f30sm106397lfa.48.2019.06.26.19.33.55
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 26 Jun 2019 19:33:55 -0700 (PDT)
Date:   Wed, 26 Jun 2019 19:24:23 -0700
From:   Olof Johansson <olof@lixom.net>
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Arnd Bergmann <arnd@arndb.de>, arm@kernel.org,
        Kukjin Kim <kgene@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [GIT PULL 3/4] arm64: dts: exynos: Pull for v5.3
Message-ID: <20190627022423.u36lomov33w3smtr@localhost>
References: <20190625193451.7696-1-krzk@kernel.org>
 <20190625193451.7696-3-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190625193451.7696-3-krzk@kernel.org>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Tue, Jun 25, 2019 at 09:34:50PM +0200, Krzysztof Kozlowski wrote:
> The following changes since commit a188339ca5a396acc588e5851ed7e19f66b0ebd9:
> 
>   Linux 5.2-rc1 (2019-05-19 15:47:09 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-dt64-5.3
> 
> for you to fetch changes up to 4dc2a25d058d71f39e41da986777327b423b92f1:
> 
>   arm64: dts: exynos: Add GPU/Mali T760 node to Exynos7 (2019-06-24 19:52:48 +0200)
> 
> ----------------------------------------------------------------
> Samsung DTS ARM64 changes for v5.3
> 
> Add Mali nodes to Exynos3 and Exynos4.


Merged, but updating the message to Exynos7/5433.



Thanks,

-Olof
