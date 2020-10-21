Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F6602949BC
	for <lists+linux-samsung-soc@lfdr.de>; Wed, 21 Oct 2020 10:57:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2502431AbgJUI5h (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Wed, 21 Oct 2020 04:57:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2502402AbgJUI51 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 21 Oct 2020 04:57:27 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D04ABC0613D4
        for <linux-samsung-soc@vger.kernel.org>; Wed, 21 Oct 2020 01:57:25 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id c194so736251wme.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 21 Oct 2020 01:57:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=oQvkweh0coyyHFs1+P/kZMwtZJPPWi3HClx7V6v1fv0=;
        b=EE/91tuK+LnQ6Bg/BJZHq1+5OAQo6TOscz5wTlYQlFCOdrCXYSUlrYitteOGw9m+LY
         STU6xM7NhAXVZvMrs/CddxhZ9Ce+pijIkJL18SFd1amKxNAH30F/FyM/bG8C+7+O+j11
         /6ubZyozbslsGF1Lvd8CED3xyzh3w0GshGNLU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=oQvkweh0coyyHFs1+P/kZMwtZJPPWi3HClx7V6v1fv0=;
        b=qposbzWWtTIUfF2ZoxNIwmlvHjaHkaFNPQlDJ6g55LnhSm3CQsCgra/l0uXaGgM7nB
         Ivx2De1ACSGwHlwY8azLwC6JbFPNS0zAb4KF0YkyZodtUbNTg0lMja+/eKHC7QbkMkb8
         rTKowt0lJccHY8r9SLQH0sc7kVrV7I65BmEfuQJ7rqDe/MusvPl8YMGHn6gnI2yRmc7F
         kcDgYC16990O0ZXLqm3DJFwgMfCWDWwCH2pjziFw5Ss/JFaijXp7ijxT6Kq/Ssd/bZLj
         dmk7eZ79K5W3nB/FjNe5M5rjLdQkCbRiXme5gxbovUjCUK/tozzV4AdJef8zFzDejatN
         E0iA==
X-Gm-Message-State: AOAM5337P4DiYrgN/Tnc85h5UHfzSXkhfjY4x4SPyaA+BJ17kOJ/9k/o
        CKFVmwIzTYtx1EtkR0p/4iQDKMbZfath2KXF
X-Google-Smtp-Source: ABdhPJxh5W+195BRlQ75jcVqoxSqHuITL1MkZ8kYhnwY/3GuozWB13g2bfVDwEcl3AUtRbmZy3j2Zw==
X-Received: by 2002:a1c:e089:: with SMTP id x131mr2512477wmg.78.1603270644597;
        Wed, 21 Oct 2020 01:57:24 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id q8sm2675939wro.32.2020.10.21.01.57.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2020 01:57:23 -0700 (PDT)
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
To:     DRI Development <dri-devel@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>
Cc:     kvm@vger.kernel.org, linux-mm@kvack.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-media@vger.kernel.org,
        linux-s390@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Kees Cook <keescook@chromium.org>,
        Dan Williams <dan.j.williams@intel.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        John Hubbard <jhubbard@nvidia.com>,
        =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
        Jan Kara <jack@suse.cz>, Bjorn Helgaas <bhelgaas@google.com>,
        linux-pci@vger.kernel.org, "Rafael J. Wysocki" <rafael@kernel.org>,
        Christian Brauner <christian.brauner@ubuntu.com>,
        "David S. Miller" <davem@davemloft.net>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Sourabh Jain <sourabhjain@linux.ibm.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Nayna Jain <nayna@linux.ibm.com>,
        Daniel Vetter <daniel.vetter@ffwll.com>
Subject: [PATCH v3 15/16] sysfs: Support zapping of binary attr mmaps
Date:   Wed, 21 Oct 2020 10:56:54 +0200
Message-Id: <20201021085655.1192025-16-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201021085655.1192025-1-daniel.vetter@ffwll.ch>
References: <20201021085655.1192025-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

We want to be able to revoke pci mmaps so that the same access rules
applies as for /dev/kmem. Revoke support for devmem was added in
3234ac664a87 ("/dev/mem: Revoke mappings when a driver claims the
region").

The simplest way to achieve this is by having the same filp->f_mapping
for all mappings, so that unmap_mapping_range can find them all, no
matter through which file they've been created. Since this must be set
at open time we need sysfs support for this.

Add an optional mapping parameter bin_attr, which is only consulted
when there's also an mmap callback, since without mmap support
allowing to adjust the ->f_mapping makes no sense.

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Kees Cook <keescook@chromium.org>
Cc: Dan Williams <dan.j.williams@intel.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: John Hubbard <jhubbard@nvidia.com>
Cc: Jérôme Glisse <jglisse@redhat.com>
Cc: Jan Kara <jack@suse.cz>
Cc: Dan Williams <dan.j.williams@intel.com>
Cc: linux-mm@kvack.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org
Cc: linux-media@vger.kernel.org
Cc: Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-pci@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Christian Brauner <christian.brauner@ubuntu.com>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Sourabh Jain <sourabhjain@linux.ibm.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Nayna Jain <nayna@linux.ibm.com>
Signed-off-by: Daniel Vetter <daniel.vetter@ffwll.com>
---
 fs/sysfs/file.c       | 11 +++++++++++
 include/linux/sysfs.h |  2 ++
 2 files changed, 13 insertions(+)

diff --git a/fs/sysfs/file.c b/fs/sysfs/file.c
index eb6897ab78e7..9d8ccdb000e3 100644
--- a/fs/sysfs/file.c
+++ b/fs/sysfs/file.c
@@ -169,6 +169,16 @@ static int sysfs_kf_bin_mmap(struct kernfs_open_file *of,
 	return battr->mmap(of->file, kobj, battr, vma);
 }
 
+static int sysfs_kf_bin_open(struct kernfs_open_file *of)
+{
+	struct bin_attribute *battr = of->kn->priv;
+
+	if (battr->mapping)
+		of->file->f_mapping = battr->mapping;
+
+	return 0;
+}
+
 void sysfs_notify(struct kobject *kobj, const char *dir, const char *attr)
 {
 	struct kernfs_node *kn = kobj->sd, *tmp;
@@ -240,6 +250,7 @@ static const struct kernfs_ops sysfs_bin_kfops_mmap = {
 	.read		= sysfs_kf_bin_read,
 	.write		= sysfs_kf_bin_write,
 	.mmap		= sysfs_kf_bin_mmap,
+	.open		= sysfs_kf_bin_open,
 };
 
 int sysfs_add_file_mode_ns(struct kernfs_node *parent,
diff --git a/include/linux/sysfs.h b/include/linux/sysfs.h
index 34e84122f635..a17a474d1601 100644
--- a/include/linux/sysfs.h
+++ b/include/linux/sysfs.h
@@ -164,11 +164,13 @@ __ATTRIBUTE_GROUPS(_name)
 
 struct file;
 struct vm_area_struct;
+struct address_space;
 
 struct bin_attribute {
 	struct attribute	attr;
 	size_t			size;
 	void			*private;
+	struct address_space	*mapping;
 	ssize_t (*read)(struct file *, struct kobject *, struct bin_attribute *,
 			char *, loff_t, size_t);
 	ssize_t (*write)(struct file *, struct kobject *, struct bin_attribute *,
-- 
2.28.0

