Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4629F3DD2F3
	for <lists+linux-samsung-soc@lfdr.de>; Mon,  2 Aug 2021 11:30:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233001AbhHBJaV (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Mon, 2 Aug 2021 05:30:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232965AbhHBJaV (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 2 Aug 2021 05:30:21 -0400
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 357CAC061798
        for <linux-samsung-soc@vger.kernel.org>; Mon,  2 Aug 2021 02:30:12 -0700 (PDT)
Received: by mail-ej1-x644.google.com with SMTP id gs8so29774462ejc.13
        for <linux-samsung-soc@vger.kernel.org>; Mon, 02 Aug 2021 02:30:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=f1HK9jb2PQ2DqEz2QoT0GvdJtMzTubqzLBH4YtWvbD8=;
        b=qlzzAKl99mr4Sh/6y6cubOOnm1iMmm72zq/21+QsW5osX+9q2T07ZFjgazah4/Rhbv
         51njbmQrzW9V9CMBxmqrvws2sBSjeXHJybAPt5ira4IhmFf1GxTsb33VhPXlWBFpljiy
         /S3NPXf203UNxk+stVVSoEIR5WmMv6cHZr+7vmsUyNdOfrRmI/ZmFi2UgAYjUp4g7eYv
         Ym1hXN5+zatLKjMQdzziPkjRgogR784ozoaUH1guje3XxGM7tQb+UIAY+gx0vm9ZC/ps
         tQbiU1TnLnKx8QrDuLKGpib3KCFtXbz8ADXC4T++b3y3C1le/yXT9m34d2C/QEGFnQOQ
         tivQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to:content-transfer-encoding;
        bh=f1HK9jb2PQ2DqEz2QoT0GvdJtMzTubqzLBH4YtWvbD8=;
        b=ZS/TxnKC5O56p6tun5EoXM8T9dXqQZEae/JPd9qf/ZR8wDHSKVDIufrR3zgSUiJw6d
         O6PV9LtXwRKrHjIkldKVlkzhhdICTXmfBe4RlnRcJu2RdBiKZ+Fkf/yKwP66KmXGDol5
         RtCRwXPp+jdb3CdC08As5itsyW2UfUjypNz1TwF4i4w3yVZwGa0QKzKatxltndM8DFUC
         FpcZBQPUX9t76d6PV8FMwN6C4FsIZSC0dlbdo+pCxME5Mf+hKmDBEymxUlWeobMt/iwY
         iBEIU/kZb9KYuB7keDvyCPXTJRiWU/PMFyZ4Yr4QTl2KF5wTRbP1/zLBiEZmw0cnYAe5
         H3dw==
X-Gm-Message-State: AOAM530Jqn85sNyZlUY1swaxAetz9LlWUTgEoFYCX/r7k2S9PSuQbz5K
        LAGBrm4L0Kcu7W25fetrYGAGyM0XUo1UNTVcUGE=
X-Google-Smtp-Source: ABdhPJxATuVb1LWjeVd4a+jNZPfEJQM9Nr0TZPHIA/hzFbiw/SQJNlhX78np9Q8raDHKD7jjDmfA6qsqLu+GCroD6S4=
X-Received: by 2002:a17:906:585a:: with SMTP id h26mr14625957ejs.31.1627896610830;
 Mon, 02 Aug 2021 02:30:10 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a50:cc92:0:0:0:0:0 with HTTP; Mon, 2 Aug 2021 02:30:10 -0700 (PDT)
Reply-To: goedert_sheryl@yahoo.com
From:   Sheryl Goedert <activationdept5@gmail.com>
Date:   Mon, 2 Aug 2021 12:30:10 +0300
Message-ID: <CA+k0Uf=7FPg1o52wjerKWSwOHyKrvJ7yVEYRa5mDzg6OtbcDuw@mail.gmail.com>
Subject: =?UTF-8?B?57Sn5oCl5Zue5bqU?=
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

LS0gDQrmiJHmmK/mnaXoh6rkvZvnvZfph4zovr7lt57nmoQgU2hlcnlsbCBHb2VkZXJ077yM5LuW
5ZyoIDIwMjAg5bm0IDEg5pyIIDI5IOaXpeS4vuihjOeahOW8uuWKm+eQg+W9qeelqOS4rei1ouW+
l+S6hiAzLjk2OQ0K5Lq/576O5YWD55qE5aS05aWW77yM5oiR55qE5aS05aWW5a+55oiR5p2l6K+0
5piv5LiA56eN56Wd56aP77yM5Zug5q2k5oiR55qE5YWo5a625Lq66YO95ZCM5oSP6L+Z5qC35YGa
44CCDQoNCuWGoOeKtueXheavkueahOeIhuWPkeS4jeS7heaYr+S4gOWcuumHjeWkp+eahOWBpeW6
t+WNseacuu+8jOS5n+aYr+WvvOiHtOS6uuS7rOWkseS4mueahOW3qOWkp+e7j+a1juegtOWdj++8
jOaJgOS7peaIkeiHquaEv+WGs+WumuaNkOi1oCAxLDUwMCwwMDAuMDAg5qyn5YWD77yIMTUwDQrk
uIfmrKflhYPvvInmnaXluK7liqkgMTAg5Liq5Lq65ZKM5bCPIOS8geS4muOAgg0KDQrpgJrov4fm
iJHnmoTnlLXlrZDpgq7ku7bkuI7miJHogZTns7vvvJpnb2VkZXJ0X3NoZXJ5bEB5YWhvby5jb20N
CuassuS6huino+abtOWkmi/lrozmlbTnmoTnu4boioLvvIzor7fmjqXlj5fov5nkuKrku6PluIHk
vZzkuLrmiJHlkozmiJHlrrbkurrnmoTnpLznianjgIINCg0K5pyA5aW955qE56Wd56aP77yMDQrp
m6rojonCt+aIiOW+t+eJuQ0KZ29lZGVydF9zaGVyeWxAeWFob28uY29tDQo=
