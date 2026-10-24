Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792830216;
	b=2HRcTNcAejIqbK06j7fUcaAtp+wExulhQKj8/3oil49IGWWWeiYjjAoaZ1wAvzjOicyE
	 jV6JFzNX8k+jtsyRq+NHlt+CunLBjSQN9KTkZ80hqBwXG5GTe7LSCSh6ZM87ugis5AVIQ
	 2TL+av9jKA4jq+xZTZN643CWXJGInfYiqBi0Ss5w/yCK6Cay5nVrIkm3yoA8QXfP80qR3
	 FJkXbYc81sjUuHJ/cFKTS5jXpxxe15HUiwxIK1wW4v7jPEL1UZNkQ16WWlYN3qezcaTBt
	 rEE+BEOUCDBHRoTmeaUbklb5NZAHUXXTvrook138PZ51V3KTrGdNSLXqTJYLDTAjZQA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792830216;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=kSRzElctNHyI0XiZ0NDOXLehvOcZI5DDhxoVLhJJnNg=;
	b=1JlA/25khkPD6Wbw7D+0Jo/mWn7eRYGBvjtQa7arTytdLUXY4ECgaVnVFYN8XNB3YSDC
	 jcGZLyppW+Tuvd6Ppd7JuLfHz7+2fQoEO0B/2Xlo3BBZsnwU3llPzd7mUJGY5s1p1rXW/
	 A2jnwrVEGV6Mf6yr2xohOqRARZlh+tmkrXzM1IGqzljvW5e0CL1OEu2+B4q9ffD5KLGCP
	 YgCOUzrpaVt4CCjnEYNe3tceCrqzeSSgEhtQqeKqnbOwpeOkheIz+cni1TTwfkmPGW4zo
	 jmzYpEmi+NGORFIV/tZwdE7lulaX6diFl+URJhbpnacV6c/APtcypt/E2TswonvFgIg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NsFeGOzW;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA9F3606A31E;
	Sat, 24 Oct 2026 08:23:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NsFeGOzW
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1792830215;
	b=bsJmvmuOR0RkfgIpo6ZU1pBvvF65eCHVbe+ZmYkjpUcKhSdEjU0fZPVET4egJErFmGSB
	 SM4bHQs3DXFezRqgrCncspMwVlHZ+QAdaG44aaRo7RQi/wdKuUaUbhbai/q+74C+0U+U2
	 KX6p+pf+pkgGM3p9VSKkVGxmKWt1gQOMzhKusKbVN/Z2fl1gp8RsjhHdDrjobkD2ep0Fo
	 kQiC7HdG+lgVLl83PjvPX6lwyrthuwl/wo3+M0hWpssL6bjisRNWE9UJZWkpiP9TpPHMA
	 3xPWUnadIUVTzNqfTwXVP/QlSz4/htpRTni3ZTl6B4v2HcF+B2wjRFQ1oekwwryMHvg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792830215;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=kSRzElctNHyI0XiZ0NDOXLehvOcZI5DDhxoVLhJJnNg=;
	b=01usPwdQTSWi8idQq75g6HuZ/0eWqWc5wx+AP+4dxodU1KRAuick653TGgod65xKBsqg
	 miEpxFCf8Ulh1pvtooKIWcPrbDwQa/aTsKiraAxkO9yX3HI10kGbpjz/ixB68JagZPCfW
	 3YT3PnA8zusb+o6tsqQnPJA2Ew1StO3tI0FsHdWrqzas8anosTKFHAt5+1fnT0/UWDBPa
	 xODZ2vzSN+zv8d6QGIqlf1ihji/xnSQf+T1I8t6o3glzAoG97uVegQhak+zqU3vhr5Fjq
	 HP3lPfhfgdet8lQqswZ0c4+NvuZhg9ZfabNWOV9YS0na6rHkk+MBPC/Jn+EFAgZLqrQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 198BC1F01825;
	Sat, 24 Oct 2026 08:23:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792830215;
	bh=kSRzElctNHyI0XiZ0NDOXLehvOcZI5DDhxoVLhJJnNg=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=NsFeGOzW+mI15bZlmeUHSArbpfvQeSs5P+iC3M81iskY82TLW2ioBJYuqM7FlSMhE
	 vYEQXyLIiGl2OVhV6jHQtSiCvirFLyO1qUf/c91YZQn91sjO2PcVTmo7XEqLJh/pI5
	 vylRTzptoCD5a2nBt3t1sC47WcyM1ZYQhFELqpXYrsFXxyn4R6TGVPeKo/gOE4hEWt
	 Bx7oKCIrgMjJvY9HTf6li4c9p9ADtp48Xq2JT0Hmxc51WA/8GEaDj/0Ifgeh3/j+uk
	 CSYYKgkiUHc2GC36jG/XGyYUNENiDQdwJSvUVm6ZigKTazO2WzwpF8YijFH9MC7t8f
	 VTOrCJATz5kOA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 8D5F644753;
	Sat, 24 Oct 2026 08:23:34 +0000 (UTC)
From: Atanas Kunchev via B4 Relay <devnull+atanaskunchev.proton.me@kernel.org>
Date: Sat, 24 Oct 2026 11:23:38 +0300
Subject: [PATCH] driver core: attribute_container: document return values
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261024-kdoc-attrcont-v1-1-b18627a05e97@proton.me>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDAyMT3eyU/GTdxJKSouT8vBLdFPMUU/MkCzMTA2MjJaCegqLUtMwKsHn
 RsbW1AOHxB+1fAAAA
X-Change-ID: 20261024-kdoc-attrcont-d7d57b864032
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
 Johan Hovold <johan@kernel.org>
Cc: driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Atanas Kunchev <atanaskunchev@proton.me>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792830221; l=3346;
 i=atanaskunchev@proton.me; h=from:subject:message-id;
 bh=LIsbRaaKztkyCnOK3iDcNAWRh1j3Q2eW+S5qjF582+M=;
 b=4w9Omiw0e+55w72tL01eC17sNjj91rSv3A0ue5icOC4YpctjQQD2wbQtfhH9nqBh10pxcfuXS
 JRDMh7gQGV0DKL7RfwjU2HYQjfoK8gc5pgU6cFyJghzKkmAcymL9HYE
X-Developer-Key: i=atanaskunchev@proton.me; a=ed25519;
 pk=UZOV7XzSdjoak/BahXi4m/UsbdgtIb1vQI3+u1lAHOc=
X-Endpoint-Received: by B4 Relay for atanaskunchev@proton.me/default with
 auth_id=1293
X-Original-From: Atanas Kunchev <atanaskunchev@proton.me>
Reply-To: atanaskunchev@proton.me
Content-Transfer-Encoding: 7bit

From: Atanas Kunchev <atanaskunchev@proton.me>

Add the missing "Return:" descriptions to the kernel-doc comments of
the attribute_container functions.

Signed-off-by: Atanas Kunchev <atanaskunchev@proton.me>
---
Fix the missing return value descriptions reported by kernel-doc -Wall.
---
 drivers/base/attribute_container.c | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/drivers/base/attribute_container.c b/drivers/base/attribute_container.c
index 3c456374247b..d2ce3a2abcab 100644
--- a/drivers/base/attribute_container.c
+++ b/drivers/base/attribute_container.c
@@ -48,7 +48,7 @@ static void internal_container_klist_put(struct klist_node *n)
  *
  * @classdev: the class device created by attribute_container_add_device.
  *
- * Returns the container associated with this classdev.
+ * Return: the container associated with this classdev.
  */
 struct attribute_container *
 attribute_container_classdev_to_container(struct device *classdev)
@@ -86,6 +86,9 @@ EXPORT_SYMBOL_GPL(attribute_container_register);
  * attribute_container_unregister - remove a container registration
  *
  * @cont: previously registered container to remove
+ *
+ * Return: 0 on success, or -EBUSY if the container still has class
+ * devices registered.
  */
 int
 attribute_container_unregister(struct attribute_container *cont)
@@ -290,6 +293,10 @@ do_attribute_container_device_trigger_safe(struct device *dev,
  * undo the partial work that has been done, on previous classdev.  It
  * is guaranteed that either they all succeeded, or none of them
  * succeeded.
+ *
+ * Return: 0 if @fn succeeded for every matching classdev, or the first
+ * error returned by @fn. In that case @undo, if given, has been run on
+ * the classdevs already processed.
  */
 int
 attribute_container_device_trigger_safe(struct device *dev,
@@ -382,6 +389,9 @@ attribute_container_device_trigger(struct device *dev,
  *
  * This simply creates all the class device sysfs files from the
  * attributes listed in the container
+ *
+ * Return: 0 on success (including when the container has no attributes),
+ * or a negative error code if creating the sysfs files failed.
  */
 int
 attribute_container_add_attrs(struct device *classdev)
@@ -417,6 +427,10 @@ attribute_container_add_attrs(struct device *classdev)
  * This performs essentially the same function as device_add except for
  * attribute containers, namely add the classdev to the system and then
  * create the attribute files
+ *
+ * Return: 0 on success, or a negative error code from device_add() or
+ * from creating the attribute files. In the latter case the class device
+ * is removed again with device_del().
  */
 int
 attribute_container_add_class_device(struct device *classdev)
@@ -482,6 +496,9 @@ attribute_container_class_device_del(struct device *classdev)
  *
  * Looks up the device in the container's list of class devices and returns
  * the corresponding class_device.
+ *
+ * Return: the matching class device, or NULL if the container has none
+ * for @dev.
  */
 struct device *
 attribute_container_find_class_device(struct attribute_container *cont,

---
base-commit: 5b0764a53235d3c77e1ed674e836e1b3fe1a4b1f
change-id: 20261024-kdoc-attrcont-d7d57b864032

Best regards,
-- 
Atanas Kunchev <atanaskunchev@proton.me>


