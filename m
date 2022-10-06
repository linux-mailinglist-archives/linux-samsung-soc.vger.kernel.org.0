Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DC26D5F6AE8
	for <lists+linux-samsung-soc@lfdr.de>; Thu,  6 Oct 2022 17:44:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231857AbiJFPo3 (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Thu, 6 Oct 2022 11:44:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231645AbiJFPo1 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 6 Oct 2022 11:44:27 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3FE857AC0C
        for <linux-samsung-soc@vger.kernel.org>; Thu,  6 Oct 2022 08:44:26 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id x40so2663397ljq.9
        for <linux-samsung-soc@vger.kernel.org>; Thu, 06 Oct 2022 08:44:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:sender:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OQx//nIMTXIuGES5wdU306SDyqo/9GYHWGhMmpKB5Ag=;
        b=dkwiFroVHj3L9SGdoZ95RCyLVkjnHYgm9/CBiXs13sPGT2nym/FM5n4FLckiNbuojv
         BOQxcVX1x0JPjuG77CxI4nw9bvtdGghlwLXgiCGHw8K8atTv5MOSWyYwI9XAPGqtwW04
         65PLiDpKVi7JN55Y3zCSdzGWV93eJZlMBpyeKCCu9exoOFNx0bd7vE9kxDJBweTsInSI
         fTX5IG+DO+uO04T31PeNyN+MSvOYnGgrxJ+poYLlRlIOW4nPkfvF4nxa87xocwPn2b2S
         9Kx0MJXMGZvT7tfTqZ2mMhiextz6S8VcLqRrKQ+ziV3UuhzVK3wc5JSCJ2NygrX0Ir0J
         xkMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:sender:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OQx//nIMTXIuGES5wdU306SDyqo/9GYHWGhMmpKB5Ag=;
        b=NFPUjJokaQZskDkhUqh7TcArdQFwwkuE/2XlOc8p4car6iCLFvXVG77fl9NKLg9Kyn
         7d0xZ7CAnn6DIrvxd7/D4IdXI0YYC6IITkOyvpSsw2sAbhb77ONMC2waWzqFJqcZPHll
         phpsVlDQwnP53HVtgYExQ2wCq5r4cYRyyf8ZBSvJIRIsK2zrnX8y1GVtChsYeqEWArpz
         MTEcJP0DGaNDC/pRFKv5FnwsIge+/cD0NN7q/LZZ+EZRVhJ4Sbp3WrrB9wWkje1WAOQ9
         dMSdSRiJq3u/7bXsdADfxYNDjfD0r1z2cw/AN7n0+z0x994DKj+OdP3J2MgKHBBObKlN
         v82w==
X-Gm-Message-State: ACrzQf0ifezsL/6PYM306SOMx3vzc79c2TcL6y95H2jFAK4yteKJYgIL
        VXckpgux2khr0yBaCEWiRJvCQMqEtzja8+1eqTs=
X-Google-Smtp-Source: AMsMyM5+s4jjf8fdufCXDofarmK4zonzH6jlgTi9ZfF3MrBk1FztHnqdI75ePTGIzQ+IhlVAaxo7AVkZTvOioKZ73Q8=
X-Received: by 2002:a2e:9d8e:0:b0:26e:3e2:2ebc with SMTP id
 c14-20020a2e9d8e000000b0026e03e22ebcmr112900ljj.166.1665071064414; Thu, 06
 Oct 2022 08:44:24 -0700 (PDT)
MIME-Version: 1.0
Sender: missabibatu@gmail.com
Received: by 2002:ab3:161a:0:b0:1e7:b9d2:aa86 with HTTP; Thu, 6 Oct 2022
 08:44:23 -0700 (PDT)
From:   Hassan Abdul <mimihassan972@gmail.com>
Date:   Thu, 6 Oct 2022 16:44:23 +0100
X-Google-Sender-Auth: FaXzkabW_wkg-p5H10Gqb2niNWo
Message-ID: <CAHRP2D42fgs8WuQuzsvYBVQj28KN3yM_yfNpTn0U_OJvtqBCvw@mail.gmail.com>
Subject: Reply Me
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=3.5 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,LOTS_OF_MONEY,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,UNDISC_MONEY autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: ***
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

i am Mrs Mimi Hassan Abdul Muhammad, and i was diagnosed with  cancer
about 2 years ago,before i go for my surgery i  have to do this by helping the
Less-privileged, with this fund so If you are interested to use the
sum of US17.3Million that is in  a Finance house) in  OUAGADOUGOU
BURKINA FASO to help them, kindly get back to me for more information.
Warm Regards,
Mrs Mimi Hassan Abdul Muhammad
