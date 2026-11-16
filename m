Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794827346;
	b=GS4PtwUMSz4GpW2wXMNC9MQl1qIjGcDeAjlbhWPNcRpoUJvxzIs3RNt2Bgz22Rkp3c30
	 JmfeRtc57KpE/B4rRawesByVqT40lxNtZR94dur7jKOv20mUbYtUXJ65vEGn3VvK6q68F
	 IyQFyvqf3hH40T3Eoxv5tjWdTrOVtVYCdZlHaSjc9Tl5LmtUsEWem+baJhAWBlPYQBmM/
	 F6WeeilIGVtFK6GvqyhrA4clStUjYAfO7PHhEiQy6PVh6nobkVz81RJplnNS23HL/eEo4
	 DzssR/9FYhFn6loO2Fba5bi8YFXQNYGMT62+lQV771DwlZfIY6x8NKLE0VMJWLFkaWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794827346;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 X-Developer-Signature:X-Developer-Key:Content-Transfer-Encoding;
	bh=vrxK8BHa7Tpi5p5VONtpcoo9vzYtSGzKykWTFXCQG5k=;
	b=SavcZFyVUYKmCI23ZuZ6vcjlyhHnt5pvQOaSK0O/EeGW2ofHkJNmlRCFVrLyNMEGwHSf
	 T8CPaCsnUNke1pw+elUqfhCIefekWvkE1hj4yiJiCLOD1ZGVZj7NO2GtZ8rL58ntRLW7j
	 D2b9ke9JrySVLGcSnP3W65y5zaLQOiPnBU1DwAi6Cvpa+RShP6xumI7O0EUKCDe6bwO7z
	 LXDVfEhpY1LfnxAZSMWNGeXlRKS058ykBbNbxzfVf2o+xVPbaN04AsX3TOecE03EIHPb0
	 MVht3V8d93KqUjNdIb8yiF651vLjCzruH775JC6iQSqjy/3NeLNXL9pPNmjWUhmcWZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=cgclkRss;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DCE3606C132
	for <driver-core@lists.linux.dev>; Mon, 16 Nov 2026 11:09:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3DCE3606C132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=cgclkRss
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-49412eb1474so1582136f8f.3
        for <driver-core@lists.linux.dev>; Mon, 16 Nov 2026 03:09:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794827344; x=1795432144; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vrxK8BHa7Tpi5p5VONtpcoo9vzYtSGzKykWTFXCQG5k=;
        b=cgclkRssiRtkpDBlsDxUFTPj2Y1zzQ+1LKnHsod6l0Yw8Hyw0Wl3jIxnwrUG1wy53j
         W3yNiYcOJq4OepmkZTRrYKzbfZxaPy3n74oxpubPHlBftT+accC0I4b+jbBTIjAu4iIf
         eKXXzR+F1Tc92fZuS9DsjGAWtfsH/jNthnpJyHnGU7eoSJWhNKRKrnmT9ju0weJA+xLp
         /DoChpYs13FhjkXs3K+XG9pAq0E1akqenZizHWV9mNBRHtaAV/lzPdonG2P8zULTeLC0
         2+AF/0spjq3rkk7RBTyYGzLGmYg41LeMFcFCPz58fJQ7Tzh/V7R+q0LTEqZv2xss3UzG
         K1aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794827344; x=1795432144;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vrxK8BHa7Tpi5p5VONtpcoo9vzYtSGzKykWTFXCQG5k=;
        b=MLSmVhpbV1oF+7erBtlO6LfwIhLvEIeVv44R8zTUmTXrt3a+fe2Zb48e0rCG/YIN3b
         SUXprOfBZvxhnkgC6Nt+OQLK78Qt2jEibOB5jUOya6ShQf8jdiN7yfkyKBe7hW4Cno24
         2djfqtpTmXeSd5DlJsXkwqTprYkBj0SpmNGxJaYRQa+MpJ+Tx//FlSychHLeHOXOdj/0
         iqycOf/9dKAUYZSLMh7kkBrZbZ+BEGjiLwCwlb+ZMEw5FSB1/sgiFETQBTPKTsb8rkG/
         nxiLsEDo9djs42nsKnmIcGx+BfpBeqj727s9RszgQ0llHwC4w/FiXHqTJ25+4Q4yMStu
         /twQ==
X-Forwarded-Encrypted: i=1; AL+hErG8dvS/l4+33GCg/RO3NTbHrHGGEUbVFPUJ1xaAusRkAz7O0KQS3qyBztpzmr3cyoBodr7jP2cidltknQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z+9B+YFCZah2fQNd5kIRvfAP3F+Z3aznzRAKdK1b1kNIl7IUxwq
	NL7Srl587s1GQPcNsrelUyYWAiRnYRcLfvIVL7v3KtsAHlsxmE0LK2Kk47Kygde3GX0=
X-Gm-Gg: AZFdTZeXnkdGq0jTCk+U5/KYdPA4KZv8EA0M8oOa7chREdKnemJI8Abzk6pnlCUijic
	JzpKSeP/TMHvGoLUUiQHf2/Gq3YSABX19Kw2UKxcrsfX6zpCt5XIhoZytkfGKVr1m8WNs8yUfED
	lDKCpSU05rhqFXBzgJffhJ8MEJ34cz5c4BXKwfZ69dlkHdnMlUW6ZpWurJYzjPVRv/2fFnL+eph
	td+EoJ40ogi4879Yf9WUVo3IPoAeOfPEPD1+LT7j3ovvhJjxg4gD/Z2EArkkiEY06ywZBUmav84
	1Je3HxUf7KNlobxjuVYwGQPCddVApACJ23XDb3k9bsw1CLIpzblNfvaOiMBcfGLhLFVNq1gS3ww
	b/igdPlqx2S9X+M3Yauo4P0eYYzyCn4RpCOtGNJeTJFbGy54n98o63l+mL2tpbLX/I31mNIPcNc
	HTF0XkNM149drruLjvYVIUQ6WguC2NjEuB0RPpdoBRNMwHltrD/CTWUafLo7OweXJw5QK8lE8AK
	syqVQPna0sC5csieJzNzO0H4STsgNhm1cO/+C9UlmQB2DtXTg8bzhGy04sEK2osOBbTcNedJLf1
	I7b0S+MrmZLxtBrAlYn2aBKsUFD0Lu19FSv1HXbzuh1VcGJu8U73tLXmusoTrhWlzpXrOZRiuqH
	PxA5SM80oP7GqtHVP
X-Received: by 2002:a05:6000:2408:b0:490:6327:96da with SMTP id ffacd0b85a97d-49c6b788747mr29898191f8f.0.1794827343493;
        Mon, 16 Nov 2026 03:09:03 -0800 (PST)
Received: from localhost (p200300f65f19a9042c263c0c153a4e28.dip0.t-ipconnect.de. [2003:f6:5f19:a904:2c26:3c0c:153a:4e28])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-49c5d03b10fsm24202375f8f.1.2026.11.16.03.09.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 03:09:02 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Johan Hovold <johan@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	David Lechner <dlechner@baylibre.com>,
	Armin Wolf <W_Armin@gmx.de>,
	Thierry Reding <thierry.reding@kernel.org>,
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Karl Mehltretter <kmehltretter@gmail.com>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	"Borislav Petkov (AMD)" <bp@alien8.de>,
	Dapeng Mi <dapeng1.mi@linux.intel.com>,
	Marco Elver <elver@google.com>,
	Ethan Nelson-Moore <enelsonmoore@gmail.com>,
	Jeff Layton <jlayton@kernel.org>,
	Bradley Morgan <brads@mainlining.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Petr Mladek <pmladek@suse.com>,
	Pnina Feder <pnina.feder@mobileye.com>,
	Mete Durlu <meted@linux.ibm.com>,
	Aaron Tomlin <atomlin@atomlin.com>,
	Rio <rioo.tsukatsukii@gmail.com>,
	Feng Tang <feng.tang@linux.alibaba.com>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	driver-core@lists.linux.dev,
	linux-trace-kernel@vger.kernel.org,
	Mark Brown <broonie@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Alex Williamson <alex@shazbot.org>
Subject: [PATCH] driver core: Disable driver overriding by default
Date: Mon, 16 Nov 2026 12:08:52 +0100
Message-ID: <20261116110853.3418077-2-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=14253; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=sqFm6ESjdybLkCEghtjL2OJfYqUeydfVlCoinB4e6MY=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBq+uRF/48exftyFahrWCtmmAi/MRPmusy2FL3Jd Xk3QPIdrIeJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCavrkRQAKCRCPgPtYfRL+ TmzpCACjwTIAF9xxChcvU9VNraL3Y2V4WoPBm/JBjd3tl4yYpPIP/6oP2kh1aaLlUabLcl8RggZ mZEB8ip2E5Uk8CFq5D8UWlt069dcwA2lQ93oIP+1An2pKKuiTYlgWniXudm5ZRJQPxypnd9vYWz Ha6m/HjH1OwralE0uY3jLD8GFB0RfLQnahIHEiU/E53eTfV86sIdnztFz53UyuLxx1yfZHJCi8e ji3kE/lWEUST9x8lnVxanYFDt1Ue+wyerLMQpur35we4te629nx1VzdEb9qNUFs8AsbFCRJ9Kzf Eye+O7EF5OKM402Nkrvy0dWJ4WHp/vRwUanXDSevgh1Bnv3n
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

Driver overriding is useful only in a very limited set of situations
and then only with very few drivers that are designed to support that.

Disallow matching via driver_override unless the driver explicitly
allows it or the safe guard is disabled using the
"allow_driver_override=1" kernel parameter.

There are many drivers that don't expect to be force-bound and often
doing it anyhow results in a NULL pointer exception. To make debugging
such cases easier, add a new taint if such a forced match happens.

Implementation detail: device_match_driver_override() isn't a static
inline any more. It grew a certain complexity (e.g. a pr_info()) and so
was made a regular exported function.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
Hello,

this is a rebase to current next of the series
https://lore.kernel.org/all/cover.1790612298.git.u.kleine-koenig@baylibre.com/
. It combines the functionality of former patches #2 and #3 (#1 was a
fix that was already applied). I also addressed sashiko's comments. I think
this matches what most people want in the previous discussion.

As the rebase wasn't trivial and I merged the two patches, I didn't
apply the review tags I already received for v3.

If this patch is accepted, a number of drivers that are supposed to be
force-bound need to get their .support_driver_override property set. I'm
aware of the following:

 - spidev_spi_driver in drivers/spi/spidev.c
 - stub_driver in drivers/pci/pci-stub.c
 - uio_dmem_genirq in drivers/uio/uio_dmem_genirq.c
 - uio_pci_driver in drivers/uio/uio_pci_generic.c
 - uio_pdrv_genirq in drivers/uio/uio_pdrv_genirq.c
 - vfio_amba_driver in drivers/vfio/platform/vfio_amba.c
 - vfio_ccw_sch_driver in drivers/s390/cio/vfio_ccw_drv.c
 - vfio_pci_driver in drivers/vfio/pci/vfio_pci.c
 - vfio_platform_driver in drivers/vfio/platform/vfio_platform.c

This is not needed for the userspace i2c driver.

As the flag to set is only introduced in this patch and assuming this
patch is accepted, I suggest to create an immutable branch for it to
allow setting the needed flags in driver trees. Alternatively let all
these go together via a single tree or branch.

Best regards
Uwe

 .../admin-guide/kernel-parameters.txt         |  6 +++
 Documentation/admin-guide/tainted-kernels.rst | 54 ++++++++++---------
 drivers/base/bus.c                            | 50 +++++++++++++++++
 include/linux/device.h                        | 19 +------
 include/linux/device/driver.h                 |  2 +
 include/linux/panic.h                         |  3 +-
 include/trace/events/module.h                 |  3 +-
 kernel/panic.c                                |  3 +-
 tools/debugging/kernel-chktaint               |  9 ++++
 9 files changed, 104 insertions(+), 45 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 85804cfe7ef6..aabc97feef9b 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -424,6 +424,12 @@ Kernel parameters
 			do not want to use tracing_snapshot_alloc() as it needs
 			to be done where GFP_KERNEL allocations are allowed.
 
+	allow_driver_override=
+			When set to 1 allow matching drivers without
+			.support_driver_override = true to devices using
+			driver_override. This is a dangerous operation in
+			general allowing root to oops the kernel.
+
 	allow_mismatched_32bit_el0 [ARM64,EARLY]
 			Allow execve() of 32-bit applications and setting of the
 			PER_LINUX32 personality on systems where only a strict
diff --git a/Documentation/admin-guide/tainted-kernels.rst b/Documentation/admin-guide/tainted-kernels.rst
index fcb8b9734548..e6bab575ccef 100644
--- a/Documentation/admin-guide/tainted-kernels.rst
+++ b/Documentation/admin-guide/tainted-kernels.rst
@@ -74,35 +74,36 @@ a particular type of taint. It's best to leave that to the aforementioned
 script, but if you need something quick you can use this shell command to check
 which bits are set::
 
-	$ for i in $(seq 0 19); do echo $i $(($(cat /proc/sys/kernel/tainted)>>$i&1));done
+	$ for i in $(seq 0 20); do echo $i $(($(cat /proc/sys/kernel/tainted)>>$i&1));done
 
 Table for decoding tainted state
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
-===  ===  ======  ========================================================
-Bit  Log  Number  Reason that got the kernel tainted
-===  ===  ======  ========================================================
-  0  G/P       1  proprietary module was loaded
-  1  _/F       2  module was force loaded
-  2  _/S       4  kernel running on an out of specification system
-  3  _/R       8  module was force unloaded
-  4  _/M      16  processor reported a Machine Check Exception (MCE)
-  5  _/B      32  bad page referenced or some unexpected page flags
-  6  _/U      64  taint requested by userspace application
-  7  _/D     128  kernel died recently, i.e. there was an OOPS or BUG
-  8  _/A     256  ACPI table overridden by user
-  9  _/W     512  kernel issued warning
- 10  _/C    1024  staging driver was loaded
- 11  _/I    2048  workaround for bug in platform firmware applied
- 12  _/O    4096  externally-built ("out-of-tree") module was loaded
- 13  _/E    8192  unsigned module was loaded
- 14  _/L   16384  soft lockup occurred
- 15  _/K   32768  kernel has been live patched
- 16  _/X   65536  auxiliary taint, defined for and used by distros
- 17  _/T  131072  kernel was built with the struct randomization plugin
- 18  _/N  262144  an in-kernel test has been run
- 19  _/J  524288  userspace used a mutating debug operation in fwctl
-===  ===  ======  ========================================================
+===  ===  =======  ========================================================
+Bit  Log   Number  Reason that got the kernel tainted
+===  ===  =======  ========================================================
+  0  G/P        1  proprietary module was loaded
+  1  _/F        2  module was force loaded
+  2  _/S        4  kernel running on an out of specification system
+  3  _/R        8  module was force unloaded
+  4  _/M       16  processor reported a Machine Check Exception (MCE)
+  5  _/B       32  bad page referenced or some unexpected page flags
+  6  _/U       64  taint requested by userspace application
+  7  _/D      128  kernel died recently, i.e. there was an OOPS or BUG
+  8  _/A      256  ACPI table overridden by user
+  9  _/W      512  kernel issued warning
+ 10  _/C     1024  staging driver was loaded
+ 11  _/I     2048  workaround for bug in platform firmware applied
+ 12  _/O     4096  externally-built ("out-of-tree") module was loaded
+ 13  _/E     8192  unsigned module was loaded
+ 14  _/L    16384  soft lockup occurred
+ 15  _/K    32768  kernel has been live patched
+ 16  _/X    65536  auxiliary taint, defined for and used by distros
+ 17  _/T   131072  kernel was built with the struct randomization plugin
+ 18  _/N   262144  an in-kernel test has been run
+ 19  _/J   524288  userspace used a mutating debug operation in fwctl
+ 20  _/Z  1048576  a driver was forced on a non-matching device
+===  ===  =======  ========================================================
 
 Note: The character ``_`` is representing a blank in this table to make reading
 easier.
@@ -189,3 +190,6 @@ More detailed explanation for tainting
  19) ``J`` if userspace opened /dev/fwctl/* and performed a FWTCL_RPC_DEBUG_WRITE
      to use the devices debugging features. Device debugging features could
      cause the device to malfunction in undefined ways.
+
+ 20) ``Z`` if a device was matched using the `driver_override` sysfs property
+     to a driver that didn't explicitly allow that.
diff --git a/drivers/base/bus.c b/drivers/base/bus.c
index 396097fdb316..5344b20488fd 100644
--- a/drivers/base/bus.c
+++ b/drivers/base/bus.c
@@ -603,6 +603,56 @@ int bus_add_device(struct device *dev)
 	return error;
 }
 
+static bool __read_mostly allow_driver_override;
+
+static int __init allow_driver_override_setup(char *str)
+{
+	if (!str || kstrtobool(str, &allow_driver_override) < 0)
+		allow_driver_override = true;
+
+	return 1;
+}
+__setup("allow_driver_override=", allow_driver_override_setup);
+
+/**
+ * device_match_driver_override() - Match a driver against the device's driver_override.
+ * @dev: device to check
+ * @drv: driver to match against
+ *
+ * Returns > 0 if a driver override is set and matches the given driver, 0 if a
+ * driver override is set but does not match, or < 0 if a driver override is not
+ * set at all.
+ */
+int device_match_driver_override(struct device *dev,
+				 const struct device_driver *drv)
+{
+	guard(spinlock)(&dev->driver_override.lock);
+	if (dev->driver_override.name) {
+		int ret = !strcmp(dev->driver_override.name, drv->name);
+
+		if (ret > 0 && !drv->support_driver_override) {
+			if (allow_driver_override) {
+				add_taint_module(drv->owner,
+						 TAINT_DRIVER_OVERRIDE, LOCKDEP_STILL_OK);
+			} else {
+				/*
+				 * If you hit this warning and you need to
+				 * quickly workaround this check, boot with
+				 * allow_driver_override=1 on the kernel
+				 * commandline. The right fix is to set the
+				 * driver's .support_driver_override property.
+				 */
+				dev_warn(dev, "Suppressed driver override binding to %s.\n", drv->name);
+				return -1;
+			}
+		}
+
+		return ret;
+	}
+	return -1;
+}
+EXPORT_SYMBOL_GPL(device_match_driver_override);
+
 static void __bus_probe_device(struct device *dev)
 {
 	struct subsys_private *sp = bus_to_subsys(dev->bus);
diff --git a/include/linux/device.h b/include/linux/device.h
index 6b082c638d45..05413c1a9454 100644
--- a/include/linux/device.h
+++ b/include/linux/device.h
@@ -907,23 +907,8 @@ static inline bool device_has_driver_override(struct device *dev)
 	return !!dev->driver_override.name;
 }
 
-/**
- * device_match_driver_override() - Match a driver against the device's driver_override.
- * @dev: device to check
- * @drv: driver to match against
- *
- * Returns > 0 if a driver override is set and matches the given driver, 0 if a
- * driver override is set but does not match, or < 0 if a driver override is not
- * set at all.
- */
-static inline int device_match_driver_override(struct device *dev,
-					       const struct device_driver *drv)
-{
-	guard(spinlock)(&dev->driver_override.lock);
-	if (dev->driver_override.name)
-		return !strcmp(dev->driver_override.name, drv->name);
-	return -1;
-}
+int device_match_driver_override(struct device *dev,
+				 const struct device_driver *drv);
 
 /**
  * device_iommu_mapped - Returns true when the device DMA is translated
diff --git a/include/linux/device/driver.h b/include/linux/device/driver.h
index 29fbc01ef06f..0153cfcbe1b9 100644
--- a/include/linux/device/driver.h
+++ b/include/linux/device/driver.h
@@ -56,6 +56,7 @@ enum probe_type {
  * @bus:	The bus which the device of this driver belongs to.
  * @owner:	The module owner.
  * @mod_name:	Used for built-in modules.
+ * @support_driver_override: driver_override only works if this is true.
  * @suppress_bind_attrs: Disables bind/unbind via sysfs.
  * @probe_type:	Type of the probe (synchronous or asynchronous) to use.
  * @of_match_table: The open firmware table.
@@ -104,6 +105,7 @@ struct device_driver {
 	struct module		*owner;
 	const char		*mod_name;	/* used for built-in modules */
 
+	bool support_driver_override;
 	bool suppress_bind_attrs;	/* disables bind/unbind via sysfs */
 	enum probe_type probe_type;
 
diff --git a/include/linux/panic.h b/include/linux/panic.h
index 17e61b61c45f..009232511cc7 100644
--- a/include/linux/panic.h
+++ b/include/linux/panic.h
@@ -89,7 +89,8 @@ static inline void set_arch_panic_timeout(int timeout, int arch_default_timeout)
 #define TAINT_RANDSTRUCT		17
 #define TAINT_TEST			18
 #define TAINT_FWCTL			19
-#define TAINT_FLAGS_COUNT		20
+#define TAINT_DRIVER_OVERRIDE		20
+#define TAINT_FLAGS_COUNT		21
 #define TAINT_FLAGS_MAX			((1UL << TAINT_FLAGS_COUNT) - 1)
 
 struct taint_flag {
diff --git a/include/trace/events/module.h b/include/trace/events/module.h
index e5a006be9dc6..d54ce3c7572b 100644
--- a/include/trace/events/module.h
+++ b/include/trace/events/module.h
@@ -26,7 +26,8 @@ struct module;
 	{ (1UL << TAINT_OOT_MODULE),		"O" },		\
 	{ (1UL << TAINT_FORCED_MODULE),		"F" },		\
 	{ (1UL << TAINT_CRAP),			"C" },		\
-	{ (1UL << TAINT_UNSIGNED_MODULE),	"E" })
+	{ (1UL << TAINT_UNSIGNED_MODULE),	"E" },		\
+	{ (1UL << TAINT_DRIVER_OVERRIDE),	"Z" })
 
 TRACE_EVENT(module_load,
 
diff --git a/kernel/panic.c b/kernel/panic.c
index 91e48d33b7db..81ea9ef9afb0 100644
--- a/kernel/panic.c
+++ b/kernel/panic.c
@@ -825,6 +825,7 @@ const struct taint_flag taint_flags[TAINT_FLAGS_COUNT] = {
 	TAINT_FLAG(RANDSTRUCT,			'T', ' '),
 	TAINT_FLAG(TEST,			'N', ' '),
 	TAINT_FLAG(FWCTL,			'J', ' '),
+	TAINT_FLAG(DRIVER_OVERRIDE,		'Z', ' '),
 };
 
 #undef TAINT_FLAG
@@ -861,7 +862,7 @@ static void print_tainted_seq(struct seq_buf *s, bool verbose)
  * exact size is allocated dynamically; the initial buffer remains
  * as a fallback if allocation fails.
  *
- * The verbose taint string currently requires up to 327 characters.
+ * The verbose taint string currently requires up to 348 characters.
  */
 #define INIT_TAINT_BUF_MAX 350
 
diff --git a/tools/debugging/kernel-chktaint b/tools/debugging/kernel-chktaint
index e1571c04afb5..56215e0f5112 100755
--- a/tools/debugging/kernel-chktaint
+++ b/tools/debugging/kernel-chktaint
@@ -211,6 +211,15 @@ else
 	addout "J"
 	echo " * fwctl's mutating debug interface was used (#19)"
 fi
+
+T=`expr $T / 2`
+if [ `expr $T % 2` -eq 0 ]; then
+	addout " "
+else
+	addout "Z"
+	echo " * A device was matched using driver_override to a driver not supporting that (#20)"
+fi
+
 echo "Raw taint value as int/string: $taint/'$out'"
 
 # report on any tainted loadable modules

base-commit: 84abb955b1015477aa11a96e2f3ac1b938b77f48
-- 
2.56.0.rc1

