Received: from smtpbgeu1.qq.com (smtpbgeu1.qq.com [52.59.177.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E81CA2701CB
	for <driver-core@lists.linux.dev>; Tue,  4 Aug 2026 05:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.59.177.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785822693; cv=none; b=QT1VWE2Fb7ZjADrJC+moJxpQ5hk5j/7LNEvPK44HMK/QM5P2k9Gyvp6j6pLH/POHBcUdwiaOxhWpnKJpwNoTWSEpb+Jx6kG4zqcPj+rBbqkMCj4pOVEG2NqqdQ5UL86oISxtCj63PjYgVCXXabZzrQt2mk0eIZimR1i1B0UgG0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785822693; c=relaxed/simple;
	bh=if02fDDgSG2rTFL87V32n/5hIwvwBiBfGF9q/hr5utM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ixZ0OU7LK5C5TMnXOdMwwz/uyCkTG1YweCA5/zfWw9UZrNbFUR9HEO1f4jYMcMUDVH1pAYI5PIkWw1McLvLB57lV10mMGOxI7N4JdymAxIrQgR027eFdoYH7EhxAVFosyq/7o7cqD7Xbp+ZGryHZTBo5SrlfZSXsNsml7fDBP14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=CiQYF/XN; arc=none smtp.client-ip=52.59.177.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="CiQYF/XN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1785822661;
	bh=cmD6D76hjereTdhykoDuzSIUyUROJBH1vqqvjuD4JhQ=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=CiQYF/XNh5aEbUDrGCkYBpezHC3a81x3qYOyk5CHZf6/X30Fs4qtbTuKqBrSOeijF
	 RRHncc+bAppimFt3xMPMU4yYINWf7KxJCQIjeAZvNwC3sDiC1MVrnhAW7E676tO/h4
	 jGQYOB5AARYZf0pQNhmgajnNEtEFK0yf8n/KwVyM=
X-QQ-mid: zesmtpsz6t1785822658t3a705a50
X-QQ-Originating-IP: gdIUxO4AhUt8rUCTctVSGDUoQr3E1LFeiIZKnJyohb0=
Received: from uniontech.com ( [113.57.152.160])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 04 Aug 2026 13:50:56 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 8993901305060445506
From: Yichong Chen <chenyichong@uniontech.com>
To: gregkh@linuxfoundation.org
Cc: dakr@kernel.org,
	djakov@kernel.org,
	driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	quic_mdtipton@quicinc.com,
	rafael@kernel.org
Subject: Re: [PATCH] debugfs: serialize debugfs_create_str() writers
Date: Tue,  4 Aug 2026 13:50:56 +0800
Message-Id: <20260804055056.877823-1-chenyichong@uniontech.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <2026080349-gristle-underdone-415d@gregkh>
References: <2026080349-gristle-underdone-415d@gregkh>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:uniontech.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: OatzRg8pHEjpP2FA3N3AygSr3n8lM025ZxDQAKdg6UWc2Uly9efSC+i8
	e4Z/VpE7Rfwl6w+qMsHjOxFtHvOtPFbdNXlPwNr2f7Fvd5ngEiBS75WDg5oTUXL8tk5bqkC
	DnglZNJpww40MmKDxKHEHtYM/thYGNMygOCGM+XFfERcCGZqaAKPjC7t/2ypLoquC4EmSWJ
	Lkba2lsRlpaM6cdgoWQn/M1omh8cVr0F012OixQ3pz8H9CrKjTVrUcJIN1wydaQ/532wwTx
	PzfD3vf6WpwmJA1c+5Nz0p2qw0vB7xhyddpPBaC/GivjsEeKGKQThh3cxqThgkS/X6mqdpg
	TOILS/Z7yc50MlWLLuwm6UI9pMAbpvVodQFg2fJoOGpAvZhAsB8IhlLueW9JBZA0Xv4IqJD
	oViRfhfUCku4Fsgq9nwXBjyDb9ZSqKVWqBAQ7IHBp0b6JxByzjd+ka94GlG5FZFmz8MF+RS
	2xy7E7xu+mxY0GDPdlbAoP5rLDuW1lGyDw1GS4aXAWutPEg0R3Z+s6TRQec2IXcaV7z57gs
	22rdTnH/rLIjR6c6OhhW/aiLyfoZif+FPF50i5LJ/6rQOCRdDAgcUc8WEK5KnP4sKMgn5i7
	uiMVr3nPsJ9aOPD1fHYWa1p93iurN0uIMPBX8xl3tZUMxiM0Qtic3HxQoikJNaYlmsWnwnq
	DHszFkP5K/VVcvzaMkkr5ABu8LRKfNCEiP7zy4ERio25OfMeWvJ9vEWVvwlaHbLg4nYoXlN
	U8GOqu4GPrFzuAoZNOWGlQ0ONVduac0Txh1soj/zwC9ut4kHetf+9S302jtLsEKSAqiMYJv
	c02P3dOEn+2Lmzu2PzF1dLwwYBW0Jd0JFjkVotu7jipO0PmFn+VL3vOeeVbjwyGLIJ5eGv8
	FuhmZMB5NKxTxooXIZ2ZsSYNFR4jvmZSJGpoXOYNexrkzEAp0eaZA5V/BRaHAJGnv9CV8rw
	FJNWwjwuPfZRtgXDLjRckW7R3nBL0rjpPTDLxMZIBWzpdqkdkNMXK74dY45HH98H1TLwnwz
	4nCyRdVMNUZ2mSKetQ
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
X-QQ-RECHKSPAM: 0

Hi Greg,

I tried the direction you suggested and converted the SoundWire
firmware_file debugfs entry away from debugfs_create_str().

The draft diff below does two things:

  1. debugfs_create_str() becomes read-only only.  It drops write
     permission bits from the requested mode.  If the caller passed only
     write bits, it creates an owner-readable file instead of a 0000 file.

  2. drivers/soundwire/debugfs.c uses debugfs_create_file() with a small
     local write-only file operation for firmware_file.

The SoundWire command path copies firmware_file under a mutex before using
it for request_firmware(), so a later debugfs write can replace the global
string without invalidating the name being used by the command.

I tested the generic debugfs_create_str() mode handling with a small test
module:

  0444 -> 0444, readable, write fails
  0600 -> 0400, readable, write fails
  0200 -> 0400, readable, write fails

I do not have SoundWire hardware in my test VM, so I could only build that
part.

Does this match the direction you had in mind?  If so, I can finish the
conversion for the interconnect writable string users as well and send a
proper v2.

Thanks,
Yichong

diff --git a/drivers/soundwire/debugfs.c b/drivers/soundwire/debugfs.c
index 099eb84a548e..9aa881689fb9 100644
--- a/drivers/soundwire/debugfs.c
+++ b/drivers/soundwire/debugfs.c
@@ -5,6 +5,7 @@
 #include <linux/device.h>
 #include <linux/debugfs.h>
 #include <linux/firmware.h>
+#include <linux/mutex.h>
 #include <linux/pm_runtime.h>
 #include <linux/slab.h>
 #include <linux/soundwire/sdw.h>
@@ -145,6 +146,7 @@ static u32 start_addr;
 static size_t num_bytes;
 static u8 read_buffer[MAX_CMD_BYTES];
 static char *firmware_file;
+static DEFINE_MUTEX(firmware_file_lock);
 
 static int set_command(void *data, u64 value)
 {
@@ -246,6 +248,7 @@ static int cmd_go(void *data, u64 value)
 {
 	const struct firmware *fw = NULL;
 	struct sdw_slave *slave = data;
+	char *fw_name __free(kfree) = NULL;
 	ktime_t start_t;
 	ktime_t finish_t;
 	int ret;
@@ -265,15 +268,23 @@ static int cmd_go(void *data, u64 value)
 	}
 
 	if (cmd == 0) {
-		ret = request_firmware(&fw, firmware_file, &slave->dev);
+		mutex_lock(&firmware_file_lock);
+		fw_name = kstrdup(firmware_file, GFP_KERNEL);
+		mutex_unlock(&firmware_file_lock);
+		if (!fw_name) {
+			ret = -ENOMEM;
+			goto out;
+		}
+
+		ret = request_firmware(&fw, fw_name, &slave->dev);
 		if (ret < 0) {
-			dev_err(&slave->dev, "firmware %s not found\n", firmware_file);
+			dev_err(&slave->dev, "firmware %s not found\n", fw_name);
 			goto out;
 		}
 		if (fw->size < num_bytes) {
 			dev_err(&slave->dev,
 				"firmware %s: firmware size %zd, desired %zd\n",
-				firmware_file, fw->size, num_bytes);
+				fw_name, fw->size, num_bytes);
 			goto out;
 		}
 	}
@@ -315,6 +326,37 @@ static int cmd_go(void *data, u64 value)
 DEFINE_DEBUGFS_ATTRIBUTE(cmd_go_fops, NULL,
 			 cmd_go, "%llu\n");
 
+static ssize_t firmware_file_write(struct file *file,
+				   const char __user *user_buf,
+				   size_t count, loff_t *ppos)
+{
+	char *new, *old;
+
+	if (*ppos)
+		return -EINVAL;
+	if (count > PAGE_SIZE - 1)
+		return -E2BIG;
+
+	new = memdup_user_nul(user_buf, count);
+	if (IS_ERR(new))
+		return PTR_ERR(new);
+	strim(new);
+
+	mutex_lock(&firmware_file_lock);
+	old = firmware_file;
+	firmware_file = new;
+	mutex_unlock(&firmware_file_lock);
+
+	kfree(old);
+	return count;
+}
+
+static const struct file_operations firmware_file_fops = {
+	.open = simple_open,
+	.write = firmware_file_write,
+	.llseek = default_llseek,
+};
+
 #define MAX_LINE_LEN 128
 
 static int read_buffer_show(struct seq_file *s_file, void *data)
@@ -358,7 +400,8 @@ void sdw_slave_debugfs_init(struct sdw_slave *slave)
 
 	debugfs_create_file("read_buffer", 0400, d, slave, &read_buffer_fops);
 	if (firmware_file)
-		debugfs_create_str("firmware_file", 0200, d, &firmware_file);
+		debugfs_create_file("firmware_file", 0200, d, NULL,
+				    &firmware_file_fops);
 
 	slave->debugfs = d;
 }
@@ -379,6 +422,8 @@ void sdw_debugfs_init(void)
 void sdw_debugfs_exit(void)
 {
 	debugfs_remove_recursive(sdw_debugfs_root);
+	mutex_lock(&firmware_file_lock);
 	kfree(firmware_file);
 	firmware_file = NULL;
+	mutex_unlock(&firmware_file_lock);
 }
diff --git a/fs/debugfs/file.c b/fs/debugfs/file.c
index 08de6652a4f3..4ce768539b4f 100644
--- a/fs/debugfs/file.c
+++ b/fs/debugfs/file.c
@@ -1049,89 +1049,26 @@ ssize_t debugfs_read_file_str(struct file *file, char __user *user_buf,
 	return ret;
 }
 
-static ssize_t debugfs_write_file_str(struct file *file, const char __user *user_buf,
-				      size_t count, loff_t *ppos)
-{
-	struct dentry *dentry = F_DENTRY(file);
-	char *old, *new = NULL;
-	int pos = *ppos;
-	int r;
-
-	r = debugfs_file_get(dentry);
-	if (unlikely(r))
-		return r;
-
-	old = *(char **)file->private_data;
-
-	/* only allow strict concatenation */
-	r = -EINVAL;
-	if (pos && pos != strlen(old))
-		goto error;
-
-	r = -E2BIG;
-	if (pos + count + 1 > PAGE_SIZE)
-		goto error;
-
-	r = -ENOMEM;
-	new = kmalloc(pos + count + 1, GFP_KERNEL);
-	if (!new)
-		goto error;
-
-	if (pos)
-		memcpy(new, old, pos);
-
-	r = -EFAULT;
-	if (copy_from_user(new + pos, user_buf, count))
-		goto error;
-
-	new[pos + count] = '\0';
-	strim(new);
-
-	rcu_assign_pointer(*(char __rcu **)file->private_data, new);
-	synchronize_rcu();
-	kfree(old);
-
-	debugfs_file_put(dentry);
-	return count;
-
-error:
-	kfree(new);
-	debugfs_file_put(dentry);
-	return r;
-}
-
-static const struct file_operations fops_str = {
-	.read =		debugfs_read_file_str,
-	.write =	debugfs_write_file_str,
-	.open =		simple_open,
-	.llseek =	default_llseek,
-};
-
 static const struct file_operations fops_str_ro = {
 	.read =		debugfs_read_file_str,
 	.open =		simple_open,
 	.llseek =	default_llseek,
 };
 
-static const struct file_operations fops_str_wo = {
-	.write =	debugfs_write_file_str,
-	.open =		simple_open,
-	.llseek =	default_llseek,
-};
-
 /**
- * debugfs_create_str - create a debugfs file that is used to read and write a string value
+ * debugfs_create_str - create a debugfs file that is used to read a string value
  * @name: a pointer to a string containing the name of the file to create.
  * @mode: the permission that the file should have
  * @parent: a pointer to the parent dentry for this file.  This should be a
  *          directory dentry if set.  If this parameter is %NULL, then the
  *          file will be created in the root of the debugfs filesystem.
- * @value: a pointer to the variable that the file should read to and write
- *         from. This pointer and the string it points to must not be %NULL.
+ * @value: a pointer to the variable that the file should read from. This
+ *         pointer and the string it points to must not be %NULL.
  *
  * This function creates a file in debugfs with the given name that
- * contains the value of the variable @value.  If the @mode variable is so
- * set, it can be read from, and written to.
+ * contains the value of the variable @value.  Write permission bits in
+ * @mode are ignored.  If this leaves no read permission bits, the file is
+ * created owner-readable.
  */
 void debugfs_create_str(const char *name, umode_t mode,
 			struct dentry *parent, char **value)
@@ -1139,8 +1076,11 @@ void debugfs_create_str(const char *name, umode_t mode,
 	if (WARN_ON(!value || !*value))
 		return;
 
-	debugfs_create_mode_unsafe(name, mode, parent, value, &fops_str,
-				   &fops_str_ro, &fops_str_wo);
+	mode &= ~S_IWUGO;
+	if (!(mode & S_IRUGO))
+		mode |= S_IRUSR;
+
+	debugfs_create_file_unsafe(name, mode, parent, value, &fops_str_ro);
 }
 EXPORT_SYMBOL_GPL(debugfs_create_str);
 
