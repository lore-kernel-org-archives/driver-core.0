Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 646CD3939D2
	for <driver-core@lists.linux.dev>; Sat,  9 May 2026 14:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778337057; cv=none; b=ZDwq4IMyCz+fPo1KmkFYMUP0j6Gexpgkrbxhl/EU4ODpFcXNa76dvvJWHqAEN8G7HtJIbRVYtX0yHKbjUiNtExmpircMQKcqGai2WhMZ439ufp2LEffG/iVbi+meL6C5qHPT4P0A/bAhS5fOoqxTeXZQNWd5+sjnhSmeqxkVWmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778337057; c=relaxed/simple;
	bh=6C9t7mvLqJfxIdsk1XSEzgDDg6fGZGpJmzji3OPwvLk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=W+51iSK1G9XBFcTgkBWp4F6bSnrsyzJXOYrBYnqPTMv2HkNwb1MKsaLL5dc/CfSU0YToXJMaWp7QQepKXHek66ew07dmptGVFLx2bfegvmiaRtW+Ybm/r87RUu1fjRM7egoETalmFjEtrtrqb/K3Y93ela7lZDoV88aYVgqps9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jmaScEnD; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jmaScEnD"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4891c0620bcso20350295e9.1
        for <driver-core@lists.linux.dev>; Sat, 09 May 2026 07:30:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778337054; x=1778941854; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3xCmQVKLqRiICM0wl4m0nAkVH1pHoZdM7w1jihSXzkk=;
        b=jmaScEnDuNvaNd01vUxIlmUvXt7hXbuv7GFsEJm/hHC/gUWyS2EsCnOyxjuPMoT4co
         +mcZTjfBpMmIMPjkFWyoc5Bd0s7xZG0CLg3LjnDxxbl+BGL+B6IoGYw7OD6ZAW9oGzAy
         dYmQ8cb49fRpHnyCNvVsZ0+O1kKtS0sUYtIaxY6wZnHb2MefMLT0Uo7+zaSa6HODm/Ny
         8owI8HKGacIMv49Cm2ru852e6NdlqVrIDHJ/m88SaNJ3c870LzwwdHabSbt7cxFAzSFu
         LGmme+WbEM1PgEUtPvhdLNeHzgtWCIw6c+bTIWUhWifAweWF+AHMdCVhhFea2eYrspRP
         kVvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778337054; x=1778941854;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3xCmQVKLqRiICM0wl4m0nAkVH1pHoZdM7w1jihSXzkk=;
        b=PQ3gBjz+HCgb8CUYeY8bb4r1xXT8+hqdaFTJNKZBgDkoQNUp4S8I+8lVnj66cRgVBt
         QCc3OtX6G5QOOd2UZ9LqSeJxLi3KKJehC7k8NOUsr8ZbguEK9B9V14RrVE7+T3U3gIk7
         szFMH8aql8GwXgOQjdoB0LfFsbNIT0PYp4eyeOZF3Dy2rPVzL7n0f17+rlzxGojrPJQo
         KS18SNZiICV9BxrczlwyMcxi9aeqA1l5OOtKQYtKudTncxPFyjj+Rw73T+WNHEb94c1x
         QxhsvBHQGQXXnpqdDFzfDfH9LdXHdEcJUS+U8XQt4KFNHpdqwRSyHJEWYsiHhzC+cseP
         zdNA==
X-Forwarded-Encrypted: i=1; AFNElJ9QdZnBTQVg1pKZU1l/dig4TDRUHRDHMSa9ucsOzh3nhttdJKp3AdBjpkgvyrAkbt6qrjhXq/amNFbNwg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw9hI+tEs7MygX+Yj1Ey6PoYZGfrnsqjNktDCQ+Mqp9YlU9vWMU
	IdEuUnHxPk/oQYzHVnPZsVZpJIjhME6wTmhyEW1tiLKDPdh4m2be8haa
X-Gm-Gg: Acq92OH48GbUGmOAh9zCQ7AJLuHNBE8cziOLOGQjTxgowIPMqCR654Hd44TOVWtSWrI
	RxpGkjnlPDh6UbgOPzChCdjcyvwNC8lJRvfQQ9Qx7ro8FPgluNM2pr3I+e6C5u0+UFRoiwuLcMU
	hrXSyEn67ky0hCJnUdjQgbCj8/oRi/tPwdB62P3MTb53b9uObj4tdfzsqAt1vCh6CCO6Aq3p5jm
	bno0gCiXSc4wb2OE+o4XAhLIcb7vkLPnA7dPY/V9P0UiGDSp+aKUI3QkoITb8F5gWW91Xb28Zyt
	cP6rjnxIGQmV3lZ2uQVjTD9utc+hfk4qU3igUxqQWAioOXK+tFzDJBsTbHTouwwx382koyFotkL
	rXJuA4emgq4YmP3slIzcgIINCKYT4wVeryIL37YSEBrYsnP/rAboCm9KVyMZ0qCHptCux9H/VQL
	t9717zvhNo6fd4MZGA7KQYyOvZ129kVORrKciSN0B/eQFEcuUUnxPhBbPEwmLDRkGGjK8TY6Rms
	Gi9zg==
X-Received: by 2002:a05:600c:524e:b0:489:1d74:56d with SMTP id 5b1f17b1804b1-48e676c14b9mr106487865e9.29.1778337053396;
        Sat, 09 May 2026 07:30:53 -0700 (PDT)
Received: from arey-arch ([2a02:1210:7298:ec00:73f0:d2e7:188c:1f61])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e702e5614sm55015505e9.9.2026.05.09.07.30.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 May 2026 07:30:52 -0700 (PDT)
From: Adrien Reynard <reynard.adrien.08@gmail.com>
To: paulmck@kernel.org,
	corbet@lwn.net,
	gregkh@linuxfoundation.org,
	dhowells@redhat.com,
	mhiramat@kernel.org
Cc: frederic@kernel.org,
	neeraj.upadhyay@kernel.org,
	joelagnelf@nvidia.com,
	josh@joshtriplett.org,
	boqun@kernel.org,
	urezki@gmail.com,
	rostedt@goodmis.org,
	skhan@linuxfoundation.org,
	rafael@kernel.org,
	dakr@kernel.org,
	pc@manguebit.org,
	rcu@vger.kernel.org,
	linux-doc@vger.kernel.org,
	driver-core@lists.linux.dev,
	netfs@lists.linux.dev,
	linux-fsdevel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Adrien Reynard <reynard.adrien.08@gmail.com>
Subject: [PATCH v2 2/4] docs: fix repeated word 'that' across documentation
Date: Sat,  9 May 2026 16:30:50 +0200
Message-ID: <20260509143050.16458-1-reynard.adrien.08@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260508163759.16231-1-reynard.adrien.08@gmail.com>
References: <20260508163759.16231-1-reynard.adrien.08@gmail.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove duplicated word 'that' found in RCU/rcu.rst,
driver-api/driver-model/overview.rst,
filesystems/netfs_library.rst, trace/histogram-design.rst
and trace/histogram.rst.

Signed-off-by: Adrien Reynard <reynard.adrien.08@gmail.com>
---
 Documentation/RCU/rcu.rst                          | 2 +-
 Documentation/driver-api/driver-model/overview.rst | 2 +-
 Documentation/filesystems/netfs_library.rst        | 2 +-
 Documentation/trace/histogram-design.rst           | 2 +-
 Documentation/trace/histogram.rst                  | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/Documentation/RCU/rcu.rst b/Documentation/RCU/rcu.rst
index bf6617b330a7..110f3d42cace 100644
--- a/Documentation/RCU/rcu.rst
+++ b/Documentation/RCU/rcu.rst
@@ -32,7 +32,7 @@ Frequently Asked Questions
   Just as with spinlocks, RCU readers are not permitted to
   block, switch to user-mode execution, or enter the idle loop.
   Therefore, as soon as a CPU is seen passing through any of these
-  three states, we know that that CPU has exited any previous RCU
+  three states, we know that the CPU has exited any previous RCU
   read-side critical sections.  So, if we remove an item from a
   linked list, and then wait until all CPUs have switched context,
   executed in user mode, or executed in the idle loop, we can
diff --git a/Documentation/driver-api/driver-model/overview.rst b/Documentation/driver-api/driver-model/overview.rst
index b3f447bf9f07..4360cd5200be 100644
--- a/Documentation/driver-api/driver-model/overview.rst
+++ b/Documentation/driver-api/driver-model/overview.rst
@@ -55,7 +55,7 @@ struct pci_dev now looks like this::
 Note first that the struct device dev within the struct pci_dev is
 statically allocated. This means only one allocation on device discovery.
 
-Note also that that struct device dev is not necessarily defined at the
+Note also that the struct device dev is not necessarily defined at the
 front of the pci_dev structure.  This is to make people think about what
 they're doing when switching between the bus driver and the global driver,
 and to discourage meaningless and incorrect casts between the two.
diff --git a/Documentation/filesystems/netfs_library.rst b/Documentation/filesystems/netfs_library.rst
index ddd799df6ce3..715218e1b233 100644
--- a/Documentation/filesystems/netfs_library.rst
+++ b/Documentation/filesystems/netfs_library.rst
@@ -626,7 +626,7 @@ A number of members are available for access/use by the filesystem:
 
    These are set by the filesystem or the cache in ->prepare_read() or
    ->prepare_write() for each subrequest to indicate the maximum number of
-   bytes and, optionally, the maximum number of segments (if not 0) that that
+   bytes and, optionally, the maximum number of segments (if not 0) that the
    subrequest can support.
 
  * ``submit_extendable_to``
diff --git a/Documentation/trace/histogram-design.rst b/Documentation/trace/histogram-design.rst
index e92f56ebd0b5..c25587f411f2 100644
--- a/Documentation/trace/histogram-design.rst
+++ b/Documentation/trace/histogram-design.rst
@@ -738,7 +738,7 @@ creates its own variable, wakeup_lat, but nothing yet uses it::
 
 Looking at the sched_waking 'hist_debug' output, in addition to the
 normal key and value hist_fields, in the val fields section we see a
-field with the HIST_FIELD_FL_VAR flag, which indicates that that field
+field with the HIST_FIELD_FL_VAR flag, which indicates that the field
 represents a variable.  Note that in addition to the variable name,
 contained in the var.name field, it includes the var.idx, which is the
 index into the tracing_map_elt.vars[] array of the actual variable
diff --git a/Documentation/trace/histogram.rst b/Documentation/trace/histogram.rst
index 340bcb5099e7..ca619499ce28 100644
--- a/Documentation/trace/histogram.rst
+++ b/Documentation/trace/histogram.rst
@@ -1700,7 +1700,7 @@ to that rule is that any variable used in an expression is essentially
 'read-once' - once it's used by an expression in a subsequent event,
 it's reset to its 'unset' state, which means it can't be used again
 unless it's set again.  This ensures not only that an event doesn't
-use an uninitialized variable in a calculation, but that that variable
+use an uninitialized variable in a calculation, but that the variable
 is used only once and not for any unrelated subsequent match.
 
 The basic syntax for saving a variable is to simply prefix a unique
-- 
2.54.0

