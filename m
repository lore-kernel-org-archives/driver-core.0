Received: from mail-dy2-f42.google.com (mail-dy2-f42.google.com [74.125.229.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B04D3318BA8
	for <driver-core@lists.linux.dev>; Sat, 26 Sep 2026 13:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790430460; cv=none; b=lzknnBni01yEfin7su6Nvnv/+32GoMM4ocRnz7uEh/cQOuW1u0rVtFwGfZhci5DxAM98JIG4lisULAuGnr8UKpbKADVjHlKWa4WaUxw7fl/oOrrog78Dm9R3LVY6jvvY4FYkFmr5CreJZoWYaqNKH3vJg6w0wBeY3vfw8H2R9Nw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790430460; c=relaxed/simple;
	bh=tQFF9BLw7VOfvbaawIs6NuKTflkxcILkdgKzZb6bEAs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CuPOKod73TZKJNU3w4PXenQ+mwV/V10nJE7CTsf5kn9hTlIVsDB0r7rnmwYTDYSbCoFouhI+VpLifATvBz64VP+tSgqm68O3bXwCQAlD7daX9K3CF5HKDgnI+dwNn5vNdSaAU39K5NkNY4gYGvYuz3GtHUQZBPzRJJAX8AQ4APo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c6gNo3jr; arc=none smtp.client-ip=74.125.229.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c6gNo3jr"
Received: by mail-dy2-f42.google.com with SMTP id 5a478bee46e88-341fe27b718so1567406eec.0
        for <driver-core@lists.linux.dev>; Sat, 26 Sep 2026 06:47:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790430458; x=1791035258; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aJYMhqDKm5GhyNvxQ9MB4u6a1fm3m9so/DIypwQkZ0k=;
        b=c6gNo3jrc//1R8gzyQ4ueRVGG+lFgsdgXZbI09FIcZ+DZaXMX4sjPzYhL9db26EMRY
         A2Lk/pOrNqV8wW05b+OgI5khd0cUpBKutXQze8ilS6H1NY7Jt/sXDhMKhPVdqys3u9gc
         hD114G6YDpgnupazP8/AIt9JA/GUD+wDSPFmqvH64Zgg0AZQxCDCxBXddgkNxYhBkvo+
         PaLkH9hQLIhHgjx9sxHwGVg99qDfihSv/H33j5W7BaTTQcBt6q0GR+KSLbpHD6k9VyTp
         WhZTvmVfb7DBYZEQRe0jkbErAMb0fFteAlAqj8IxTJLd0Yc4FFwlkSDFKFR2dZNPHLdV
         rmiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790430458; x=1791035258;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aJYMhqDKm5GhyNvxQ9MB4u6a1fm3m9so/DIypwQkZ0k=;
        b=I3mel5i0Vl66qQKQNI/cJEQ2PoGCAuZ0bGkDAezS8cUOdU55HYHJPS+tAVf+N0CmFE
         89darQbx4+x+6J6T6+7TSXhCR7/6w/7POLbAOb6O/dflxy5PC/YNnHKI9JIiVy1j43t4
         gW3d1s/H/NDqfv9+p/UKR8nx+2fyyoffkCqzzsJ7bczuWA0QFhWPkn2qtAPFrRJ66qLM
         M27YCgLNcrqZFmpp51AB3/imSaw6s18johZR7T4wQzNyB4v0NEWMWeQY7RfpSoextK8R
         2oGtMRO1NEydrny71EqYcG5AzxwJ4/97JpLfTVFfsNZK3IMQ5L1hBCgBHjO/LjYpx25l
         ZXMA==
X-Gm-Message-State: AFuF++nuEB9NzbQ26UcQSyrZvqly7S29BQDPuOE8mxU3TVolNof5RtxI
	M9RjZoyECGRE8BgeuPHc7HUuuT8W3v/i0CjUMLDFIEZqMPELlnsPCZJW
X-Gm-Gg: AYBFou1/GqDplHsyDaFnZeyErkXd72xCR0qNeSwIuCum65OZPhxFMFWPM4Jxd6oxN4S
	/C5O8xNLcKmhRvZcyMu5OBXAFt4EIaHN6DOCHh+Y2LlMHvkcIFT6FS9mbUfXnQTo3NKbjK4Y3K4
	wwVVm6Vg8gLqNXZwBttK+XI12UHysu8g38x6rVMDreu5w6FdahLPUqbVPE48m+Z0UNjs7LuDTCl
	cV8lEo6uk4tm2mWJuxEBZJi2lcq5kndVi1IXg02Hyehw2PWkGzKn2IquUUFIKxZDa1C/cRfAwN5
	CPzaW3IdY0ezljc7nctcMXX1grT06d7ZySeaDJ0FLo0GVAawks7WMagz9TxJtgIBjv5XB9HHG8/
	hy7KrCILSSZoVGaBbyLhhRwKHWuSueBb7FofFgwT1T1ABL7tpSgYARdtDreTb0N6KGGNGJtUik3
	fWMiwxCiwDqPxXDb/U+/9os5Xr2mBfZ9DzITnssFXGDH+ZRZpSBU8FhGjcyzUE0L8=
X-Received: by 2002:a05:7023:a5c:10b0:144:f9e5:c355 with SMTP id a92af1059eb24-146d058dcb5mr3102537c88.41.1790430457523;
        Sat, 26 Sep 2026 06:47:37 -0700 (PDT)
Received: from beelink.. ([187.13.30.172])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34144b4ae50sm14942565eec.17.2026.09.26.06.47.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 06:47:37 -0700 (PDT)
From: Aldo Ariel Panzardo <qwe.aldo@gmail.com>
To: gregkh@linuxfoundation.org,
	rafael@kernel.org,
	dakr@kernel.org
Cc: driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Aldo Ariel Panzardo <qwe.aldo@gmail.com>
Subject: [PATCH v2 0/2] debugfs: fix UAF and double-free in debugfs_str read/write
Date: Sat, 26 Sep 2026 10:47:26 -0300
Message-ID: <20260926134726.1063068-1-qwe.aldo@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <2026092647-ebony-unlatch-d3d0@gregkh>
References: <2026092647-ebony-unlatch-d3d0@gregkh>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sat, Sep 26, 2026 at 08:53:06AM +0200, Greg Kroah-Hartman wrote:
> Did you forget an Assisted-by: tag here?

Yes, apologies.  Both patches now carry:

  Assisted-by: sashiko.dev <sashiko-bot@kernel.org>

> And how was this found and tested?

sashiko.dev flagged that the write path uses rcu_assign_pointer() /
synchronize_rcu() / kfree() but the read path dereferences the same
pointer without rcu_read_lock().  I then manually reviewed the write
path and found the second issue: no mutual exclusion between concurrent
writers, leading to a double-free of `old`.

Tested on QEMU/KVM with CONFIG_KASAN=y.  The double-free in the write
path reproduces immediately (~3900 KASAN reports in a single run with 8
concurrent writers):

  BUG: KASAN: double-free in debugfs_write_file_str+0x194/0x200

Full splat is included in patch 2/2.

The read-path UAF has a narrower race window (just a couple of
instructions between pointer load and strlen()) and did not trigger in
KASAN testing, but it is structurally obvious: the write path calls
synchronize_rcu() + kfree(old) and the read path does not hold
rcu_read_lock().

> And what kernel was tested, debugfs strings were changed a bunch in 7.1,
> what bug report are you working off of here?

Verified against torvalds/linux master at v7.3-rc4 (commit
6812ce4e4379, 2026-09-26).  Both bugs are present in the current code
at debugfs_read_file_str() and debugfs_write_file_str() in
fs/debugfs/file.c.

This is not from a bug report.  It was found by sashiko.dev reviewing
an adjacent patch and I verified it independently.

> and shouldn't this be multiple patches as you are doing two different
> things?

Agreed.  Split into two patches below.

Aldo Ariel Panzardo (2):
  debugfs: fix use-after-free in debugfs_read_file_str()
  debugfs: serialize concurrent writers in debugfs_write_file_str()

 fs/debugfs/file.c | 38 ++++++++++++++++++++------------------
 1 file changed, 20 insertions(+), 18 deletions(-)

--
2.43.0
